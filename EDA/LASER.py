import numpy as np
import matplotlib.pyplot as plt
import torch as th
# 기본단위 m
points = 1000
UNIT = 1e10
WAVELENGTH = 670e-9 * UNIT
WAVENUMBER = 1 / WAVELENGTH * 2 * np.pi
GAP_DOUBLE_SLIT = {
  14: 356e-6 * UNIT,
  15: 406e-6 * UNIT,
  15: 457e-6 * UNIT,
}

def gpu_mul(A, B):
  A = th.tensor(A, dtype = th.complex128).to('mps')
  B = th.tensor(B, dtype = th.complex128).to('mps')
  return th.matmul(A, B).to('cpu').numpy()

def numba_mul(A, B):
  return A @ B

def numba_get_mul(distance_arr):
  return np.exp(1j * WAVENUMBER * distance_arr) / distance_arr

def numba_dist(A, B, distance):
  return np.sqrt(distance**2 + np.square(A - B))

class Hole:
  def __init__(self, position, width, points = 1000):
    self.position = position
    self.width = width
    self.position_arr = np.linspace(self.position - width / 2, self.position + width / 2, points).T
    self.field = np.zeros_like(self.position_arr, dtype = np.complex128)
  
  def set_field(self, field):
    self.field = field

def hole_to_hole(hole1, hole2, distance):
  field1 = hole1.field # n x 1
  position_arr1 = hole1.position_arr # n x 1
  position_arr2 = hole2.position_arr # m x 1

  # distance_arr = np.sqrt(distance**2 + np.square(position_arr1[np.newaxis, :] - position_arr2[:, np.newaxis])) # m x n
  distance_arr = numba_dist(position_arr1[np.newaxis, :], position_arr2[:, np.newaxis], distance)
  
  mul = numba_get_mul(distance_arr)
  # return field1 @ mul.T
  return field1 @ mul.T

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
def simulate(slit_position, slit_type, blocker_position, detector_position):
  distance3 = 0.389 * UNIT

  gap = GAP_DOUBLE_SLIT[slit_type]
  slit_hole1 = Hole(slit_position, 85e-6 * UNIT)
  slit_hole2 = Hole(np.array(slit_position) + gap, 85e-6 * UNIT)

  distance2 = 0.009815 * UNIT
  blocker = Hole(blocker_position, 1778e-6 * UNIT, points = 1000)

  distance1 = 0.489 * UNIT
  
  detector = Hole(detector_position, 85e-6 * UNIT, points = 3)

  slit_hole1.set_field(np.ones_like(slit_hole1.field))
  slit_hole2.set_field(np.ones_like(slit_hole2.field))

  blocker.set_field(hole_to_hole(slit_hole1, blocker, distance2) + hole_to_hole(slit_hole2, blocker, distance2))
  detector.set_field(hole_to_hole(blocker, detector, distance1))

  # detector.set_field(hole_to_hole(slit_hole1, detector, distance1) + hole_to_hole(slit_hole2, detector, distance1))
  return field_to_intensity(detector.field)
