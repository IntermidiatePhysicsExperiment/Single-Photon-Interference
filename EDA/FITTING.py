import matplotlib.pyplot as plt
import torch as th
from numba import njit

np = th

# 기본단위 m
slit_points = 10
blocker_points = 100
METER = 1e10
WAVELENGTH = 670e-9 * METER
WAVELENGTH_SIG = 20e-9 * METER
gamma = 10

# PARAMS
WAVENUMBER = 1 / WAVELENGTH * 2 * np.pi
WAVENUMBER_SIG = WAVENUMBER * WAVELENGTH_SIG / WAVELENGTH

double_left_width = 85e-6 * METER
double_right_width = 85e-6 * METER
detector_width = 85e-6 * METER

blocker_width = 1778e-6 * METER
GAP_DOUBLE_SLIT = {
  14: 356e-6 * METER,
  15: 406e-6 * METER,
  15: 457e-6 * METER,
}
distance1 = 0.489 * METER
distance2 = 0.009815 * METER

def gpu_mul(A, B):
  A = th.tensor(A, dtype = th.complex128).to('cuda')
  B = th.tensor(B, dtype = th.complex128).to('cuda')
  return th.matmul(A, B).to('cpu').numpy()

def gpu_get_mul(distance_arr, wavenumber):
  dist = th.tensor(distance_arr, dtype=th.complex128)
  return th.exp(dist * 1j * wavenumber) / dist

@njit
def numba_mul(A, B):
  return A @ B

@njit
def numba_get_mul(distance_arr, wavenumber):
  return np.exp(1j * wavenumber * distance_arr) / distance_arr

@njit
def numba_dist(A, B, distance):
  return np.sqrt(distance**2 + np.square(A - B))

class Hole:
  def __init__(self, position, width, points = slit_points):
    self.position = position
    self.width = width
    self.position_arr = np.linspace(self.position - width / 2, self.position + width / 2, points).T
    self.field = np.zeros_like(self.position_arr, dtype = np.complex128)
  
  def set_field(self, field):
    self.field = field

def hole_to_hole(hole1, hole2, distance, wavenumber):
  field1 = hole1.field # n x 1
  position_arr1 = hole1.position_arr # n x 1
  position_arr2 = hole2.position_arr # m x 1

  # distance_arr = np.sqrt(distance**2 + np.square(position_arr1[np.newaxis, :] - position_arr2[:, np.newaxis])) # m x n
  distance_arr = numba_dist(position_arr1[np.newaxis, :], position_arr2[:, np.newaxis], distance)
  
  # wavenumber = WAVENUMBER_GEN(distance_arr.shape)
  mul = numba_get_mul(distance_arr, wavenumber)
  # return field1 @ mul.T
  return gpu_mul(field1, mul.T)

def hole_to_moving_hole(hole1, hole2, distance):
  field1 = hole1.field # n x 1
  position_arr1 = hole1.position_arr # n x 1
  position_arr2 = hole2.position_arr # m x k
  # distance_arr = np.sqrt(distance**2 + np.square(position_arr1[np.newaxis, :] - position_arr2[:, :, np.newaxis])) # m x k x n
  distance_arr = numba_dist(position_arr1[np.newaxis, :], position_arr2[:, :, np.newaxis], distance)

  mul = numba_get_mul(distance_arr)
  return np.sum(field1[np.newaxis, :] @ mul, axis = 2)

def field_to_intensity(field):
  return np.linalg.norm(field)**2

n = 200
slit_position, slit_type, blocker_position, _ = [5.5e-3 * METER, 14, 5.5e-3 * METER, 0]

def simulator(theta = [
  double_left_width,
  double_right_width,
  detector_width,
  blocker_width,
  distance1,
  distance2,
  WAVENUMBER,
  # gamma,
  slit_position, 
  blocker_position, 
], use_wavenumber = False):
  double_left_width = theta[0]
  double_right_width = theta[1]
  detector_width = theta[2]
  blocker_width = theta[3]
  distance1 = theta[4]
  distance2 = theta[5]
  wavenumber = theta[6]
  # gamma = theta[8]
  slit_position = theta[7]
  blocker_position = theta[8]
  
  gap = GAP_DOUBLE_SLIT[slit_type]
  slit_hole1 = Hole(slit_position, double_left_width)
  slit_hole2 = Hole(np.array(slit_position) + gap, double_right_width)

  blocker = Hole(blocker_position, blocker_width, points = blocker_points)

  slit_hole1.set_field(np.ones_like(slit_hole1.field))
  slit_hole2.set_field(np.ones_like(slit_hole2.field))

  blocker.set_field(hole_to_hole(slit_hole1, blocker, distance2, wavenumber) + hole_to_hole(slit_hole2, blocker, distance2, wavenumber))
  
  def simulate(detector_position):
    detector = Hole(detector_position, detector_width)
    detector.set_field(hole_to_hole(blocker, detector, distance1, wavenumber))

    return field_to_intensity(detector.field)
  return simulate