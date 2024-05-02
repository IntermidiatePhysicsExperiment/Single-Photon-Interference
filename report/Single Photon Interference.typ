#import "template.typ": *
#import "@preview/tablex:0.0.8": *
#let th=[#math.theta]
#let ll=[#sym.angle.l]
#let rr=[#sym.angle.r]
#let times="×"
#show: project.with(
  title: "Single Photon Interference",
  authors: (
    (name: "Seunghyun Moon", email: "shmoon232@snu.ac.kr", affiliation: "Department of Physics and Astronomy, Seoul National University,\nSeoul, 08826 South Korea"),
  ),
  abstract: "파동은 이중 슬릿을 통과하면서 고유의 무늬를 만들어내며, 이는 Huygens의 이론으로 설명된다. 파동의 일종인 빛 또한 이 성질을 가진다. 하지만 빛은 광자로 이루어져 있으며, 우리는 셀 수 있는 수의 광자를 이용해 실험을 진행하며 이중 슬릿 무늬를 확인하는 것으로 입자인 광자가 간섭 무늬를 만들어낸다는 것을 확인하고자 한다. 이를 위해 우리는 LASER와 약한 빛을 내는 Bulb를 광원으로 가지며 각각에 대해 photodiode와 PMT를 detector로 사용하는 techspin 사의 실험 장치를 이용하여 실험을 진행하였으며, 각 실험에서의 결과를 예측하여 피팅하였다."+"\n"+text(weight: "bold")[Keywords: ]
  +"Interference, Single Photon, Huygens-Fresnel Principle",
  date: "April 11, 2024",
)

= Introduction

== Single Photon Interference

1807년 T. Young은 자신의 강의에서 이중 슬릿 실험을 설명하였다 @young1807course. 이 이중 슬릿 실험 실험 결과는 빛이 파동임을 입증하였고, 이후 1864년 J. Maxwell이 전자기파에 관한 이론을 정립하며 빛이 전자기파라는 파동임이 널리 알려졌다 @maxwell1864ii. 그러나 1905년 A. Einstein은 광전효과에 관한 논문에서 광양자 가설을 제시하였고@einstein1905heuristic, 이후 1916년 R. Millikan에 의해 실험적으로 검증되었으며@millikan1916direct@millikan1916einstein, A. Compton이 1923년 콤프턴 산란을 발표하며 빛의 입자성이 입증되었다 @compton1923quantum. 그러나 여전히 T. Young의 실험 결과는 유효하므로 광자라는 입자는 파동성을 가지며, 스스로 간섭을 일으킬 수 있다는 것을 유추할 수 있다. 실제로 1987년 P. Grangier 등 단일 광자 간섭 실험을 통해 이를 입증하였으며, 많은 연구자들이 이 실험을 재현하였다@grangier1986experimental @luo2024young @kim2023revisiting.

== Huygens-Fresnel Principle 

1690년 C. Huygens는 파동의 진행을 설명하기 위해 Huygens-Fresnel 원리를 제시하였다 @huygens1690traité. 이 원리는 각 점에서 파동이 진행할 때, 그 점을 중심으로 작은 구를 생각하고, 그 구면에서 파동이 진행하는 것으로 가정한다. A. Fresnel은 이 원리를 발전시켜 파동의 간섭을 설명하였다 @fresnel1819memoire@mollon2002origins. 이 원리를 맥스웰의 전자기학과 함께 적용하면 각 위치의  전기장 값을 통해서 이중 슬릿 실험의 결과를 설명할 수 있다 @jeffers1995maxwellian. 

#figure(
  image("images/Double Slit Figure.png", width:60%),
  caption: "Figure of Double Slit and Source",
) <double_slit_fig>

위 @double_slit_fig 과 같이 Source와 Slit이 배열되어 있다고 생각했을 때, 각 Slit에 도달하지 않은 지점의 전기장은 원점이 Source일때 
$|E(arrow(r))| = exp(i k r) \/ r$ 으로 주어진다. 여기서 $arrow(k)$는 파수 벡터이다. 또, Slit 위의 점 P에서의 위치 벡터가 $arrow(r)_p$이고 전기장이 $E_1$이면 Slit을 지난 위치에서 P가 만든 전기장은 
$|E(arrow(r))| = exp(i k |arrow(r)-arrow(r)_p|)\/|arrow(r)-arrow(r)_p|$
으로 주어진다. 이러한 전기장을 모두 더하면 슬릿을 지난 위치에서의 전기장을 계산할 수 있을 것이다. 이 과정을 R. Hogan은 시뮬레이션을 통해서 아래 @double_slit_e 와 같이 시각화 해 내는데에 성공하였다 @hogan2008radiation.

#figure(
  image("images/Double Slit E.png", width: 50%),
  caption: [Figure of Electric Field on Double Slit Experiment @hogan2008radiation],
)<double_slit_e>

위 @double_slit_e 과 같이 각 위치에서의 전기장을 나타낼 수 있으며, 시간을 바꾸어 가면서 어떻게 전달되는지를 계산할 수 있다. 그리고 이 과정에서 실제로 에너지가 어떻게 전달되는지는 포인팅 벡터의 계산을 통해서 알 수 있는데 @jeffers1995maxwellian@maxwell1864ii, 이를 위한 시뮬레이션 또한 R. Hogan은 성공적으로 시각화하였다 @hogan2008radiation. 아래 @double_slit_p 를 통하여 실제로 에너지가 이중 슬릿을 통해서 어떻게 전달되는지를 파악하고, 영의 이중 슬릿 실험의 결과@young1807course 를 설명할 수 있다.

#figure(
  image("images/Double Slit Poynting.png", width: 50%),
  caption: [Figure of Poynting Vector on Double Slit Experiment @hogan2008radiation],
)<double_slit_p>

이중 슬릿 실험의 실험 결과를 Huygens-Fresnel Principle을 이용하여 이론적으로 유도해 보도록 하자. 우선 아래 @double_slit_diagram 과 같이 이중 슬릿 실험 위에서 각 변수를 정의하도록 한다.

#figure(
  image("images/Double Slit Diagram.png", width: 80%),
  caption: [Figure of Double Slit with Parameters],
)<double_slit_diagram>

위 @double_slit_diagram 과 같은 세팅에서 Detector의 위치가 $x$라면 $x << L$이므로 두 슬릿에서의 $theta$는 $x\/L$로 같다고 가정한다. 여기서 Detector에 도달하는 빛의 세기는 단일 슬릿과 이중 슬릿의 곱으로 나타낼 수 있다. 단일 슬릿의 세기 그래프는 $beta=1/2 k b sin theta$일때 $((sin beta) / beta)^2 $에 비례하는 형태로 주어지며, 이중 슬릿의 세기 그래프는 $gamma = 1/2 k h sin theta$일때 $cos^2 gamma$에 비례하는 형태로 주어진다. 이를 이용하여 이중 슬릿의 세기를 유도하면 아래와 같이 주어진다. @manual @pearson2018slit
$
I(x) = I_0 ((sin beta(x))/beta(x))^2 cos^2 gamma(x)
$ <I_simple_cal>

== Line Width

본 실험에서 사용하는 광원 중 LASER는 특정 파장의 빛만을 방출하는 광원으로 생각된다. 즉, LASER의 spectral line이 detla function이라는 것이다. 그러나 이는 사실이 아니다. 레이저의 spectral line은 아래 @laser_line_width 과 같이 일정한 폭을 가지며, 이를 line width라고 한다. 또, 여기서 진동수나 파수 그래프의 개형은 Lorentzian 형태를 띈다는 것이 알려져 있다 @henry1982theory @wu2024narrow. 이러한 점을 고려하기 위해서 LASER의 선폭을 측정하는 방법론들이 알려져 있지만 본 실험에서는 이중 슬릿 실험에서의 피팅을 통해 알아내도록 한다 @okoshi1980novel.

#figure(
  image("images/linewidth.png", width: 50%),
  caption: [Figure of Laser Line Width from Experiment @hinkley1969direct],
)<laser_line_width>

위 @laser_line_width 와 같은 개형을 띄는 Lorentzian은 중앙이 $x_0$일때 확률 분포가 @Lorentzian 와 같이 주어지는 함수이다.
$
p(x) = 1 / (pi gamma (1 + ((x-x_0) / gamma)^2))
$ <Lorentzian>
파수가 Lorentzian을 따르는 것이 알려져 있으므로 이를 이용하여 @I_simple_cal 에서 계산한 결과를 대입하면 아래와 같이 나타낼 수 있다.
$
I(x) = I_0 integral_0^infinity p(k) ((sin beta(k, x))/beta(k, x))^2 cos^2 gamma(k, x) " " d k
$ <I_with_linewidth>

본 실험에서 사용하는 또다른 광원인 Bulb는 자명하게 고유의 spectral line을 가지고, 이 spectral line이 어떠한 모양을 가지게 되는지는 bulb의 작동 원리에 따라 다르다. 그러나 본 실험에서 사용하는 bulb는 특정 파장에서의 실험을 목적으로 하고 있어 다양한 파장에서 peak가 나타나지는 않을 것으로 예상되고, 충분히 linewidth가 작을 것으로 예상되니 Lorentzian으로 근사할 수 있다 @manual. 따라서 위 @I_with_linewidth 와 동일한 방법을 이용하여 세기를 계산할 수 있다.

= Experimental Methods

== Apparatus

본 실험을 위해서 Techspin 사의 "Two-Slit Interference, One Photon at a Time"을 사용하였다 @techspin2012two-slit. 이 실험장치는 아래 @materials 와 같은 구성으로 이루어져 있다.

#figure(
  image("images/Materials.png", width: 100%),
  caption: [Figure of the materials for the Experiment @techspin2012two-slit],
)<materials>

기본적으로 실험은 Source에서 나온 광자를 Double Slit을 통과시키며 간섭을 일으키고, 여기서의 간섭 결과를 Detector Slit을 통과시키며 빛의 세기(광자의 수)를 측정한다. 이때 Detector Slit의 위치를 이동해 가며 빛의 세기를 측정하면 각 위치에서의 세기를 얻어 간섭 결과를 얻을 수 있다.
여기서 Source는 LASER와 Bulb 중 하나를 선택하여 사용할 수 있다. LASER는 강한 빛을 가지고 있어 detector로 photodiode를 사용한다. 하지만 Bulb는 LASER보다 약한 빛을 가지고 있으며, 적은 수의 광자를 사용하기에 PMT를 detector로 사용하여야 한다 @techspin2012two-slit@hertz1887ueber. 

== Align

위 @materials 와 같이 실험 장치들이 구성되어 있을 때, 올바른 실험을 위해서는 많은 물체가 하나의 직선 위에 나란히 놓여 있다는 가정이 필요하다. 여기서 나란히 놓여 있어야 하는 대상들로는 Source, Source에서의 슬릿, Double Slit, Blocker Slit, Detector Slit, Detector가 있다. 이러한 대상들을 순서대로 나란히 놓는 과정을 Align이라고 한다. 
LASER의 경우 충분히 강한 빛을 가지고 있어 육안으로도 판별할 수 있었으며 Align에 사용된다. 반면 Bulb는 비교적 약한 빛을 가지고 있어 육안으로 확인할 수 없기에 LASER를 통해 Align을 수행한다. 우선 실험 장치에 고정된 Detector는 중앙에 있었으므로 중앙 위치에 모든 Slit과 Source를 나란히 놓는 것을 목적으로 한다. 

#figure(
  image("images/reflected laser.png", width: 80%),
  caption: [Figure of Reflected Laser],
) <reflected_laser>

이를 위해 중앙에 검은 선이 그어진 T자 종이를 이용하여 @reflected_laser 와 같이 LASER를 놓았을 때 반사된 빛이 하단에 잘 보이지 않도록 레이저를 배치하였다. 이후 이 레이저를 이용하여 Double Slit이 중앙에 오도록 조정한다. 중앙에 온 것은 위 @reflected_laser 에서 보이는 종이 위에 비치는 상을 통해서 알 수 있다. 그 뒤, Blocker 구멍 사이로 빛이 모두 통과할 수 있도록 해 주는 과정을 수행하고, 마지막으로 Detector Slit이 중앙에 오도록 조정하는 과정을 수행한다. 이러한 과정을 통해 실험 장치를 Align하였다. 

#figure(
  image("images/source slit align.png", width: 90%),
  caption: [Aligning Source Slit],
) <source_align>

Source Slit을 배치하는 경우에 위 @source_align 와 같은 단일 슬릿 간섭 무늬를 얻을 수 있다. 여기서 양쪽으로 생겨나는 간섭 무늬들이 세로의 검은 선과 평행하게 나타나도록 맞추는 것으로 적절하게 Align을 수행할 수 있다.

#figure(
  image("images/double slit align.png", width: 90%),
  caption: [Aligning Double Slit],
) <double_slit_align>

Source slit을 잘 배치한 뒤 이중 슬릿을 배치하는 경우에 위 @double_slit_align 과 같은 무늬를 얻을 수 있다. 여기서 도드라지게 생겨난 세로 무늬가 세로의 검은 선과 평행하게 나타나거나 온전히 겹쳐지는 것으로부터 Align을 수행할 수 있다.

#figure(
  image("images/blocker align.png", width: 90%),
  caption: [Aligning Blocker Slit @manual],
) <blocker_align>

Align하는 과정에서 각 슬릿이 평행하게 놓여 있어야 하는데, 이는 Blocker Slit을 움직이는 과정에서 Double Slit이 만드는 두 레이저가 @blocker_align 에서의 왼쪽 그림과 같이 일정하게 줄어드는 것을 확인하여야 한다. 오른쪽 그림과 같이 줄어드는 경우에 Double Slit과 Blocker가 평행하게 놓여있지 않다는 것을 의미한다. 이러한 경우에는 Blocker Slit을 조정하여 Double Slit과 평행하게 놓여 있도록 한다. 

=== Position of Blocker Slit

위 실험에서 Blocker Slit의 위치는 중요한 역할을 한다. Double slit에서 나온 빛이 Blocker를 최대한 온전히 통과하도록 하거나 정확히 한쪽을 차단하도록 하는 것이 실험에서 중요한 역할을 한다. 여기서 실험에 필요한 Blocker Slit의 위치를 알기 위해서 나머지 조건을 고정한 뒤에 Blocker Slit의 위치를 바꾸어 가며 Intensity를 측정하도록 한다. 이때 Double Slit의 모든 빛이 Blocker를 통과하는 영역 중 가장 안정적으로 통과하는 중앙 지점과 Intensity 그래프에서 기울기를 가지는 영역을 구하여 일부만이 가려질 수 있게 하는 Blocker Slit의 위치를 찾는 것을 목표로 한다. 

== LASER

레이저에 대해서는 총 세 종류의 실험을 진행하도록 한다. 첫 번째 실험은 Blocker가 완전히 열린 상태에서 실험을 진행하여 영의 이중 슬릿 실험을 재현하는 것이다. 주어진 슬릿 세 종류(14, 15, 16호)슬릿을 하나씩 바꾸어 가며 실험을 진행한다. 두 번째 실험은 Blocker를 이용해 두 개의 슬릿 중 한 쪽 슬릿은 온전히 가려지고 반대쪽 슬릿은 온전히 열린 상태가 되도록 만든 뒤 진행하는 것이다. 이 실험에서는 위에서 측정한 위치를 미세하게 이용하여 Blocker를 조정하도록 한다. 양쪽 슬릿에 대해서 실험을 진행하나, 슬릿 중에서는 14호 슬릿만 사용하여 실험을 진행한다. 마지막으로 세 번째 실험은 비대칭 이중 슬릿 회절 실험으로, 이중 슬릿의 두 구멍 중 한쪽만이 부분적으로 가려지도록 Blocker를 조정하여 진행하는 실험이다. Blocker의 위치가 한쪽 슬릿이 막 그려지기 시작하기만 하는 위치에서 실험을 진행하며, 이 실험 역시 14호 슬릿에서만 실험을 진행하였다.

== Bulb

전구에 대해서 실험을 시작하기 이전에 Blub의 Detector인 PMT의 구동 전압을 정해야 한다. PMT가 작동할 때에 PMT의 구동 전압이 주어지는데, 이 구동 전압은 광자가 들어왔을 때 PMT가 인식하는 정도를 나타내며, 광자의 수를 측정하는 데에 있어서 중요한 역할을 한다. 이 구동 전압을 정하기 위해 아주 조금의 빛이 있는 상태와 아예 없는 상태에서 측정을 진행하여 PMT가 인식하는 정도를 측정하고, 이를 통해 구동 전압을 얻도록 한다. 또, threshold voltage또한 시간당 들어오는 광자의 수를 측정하는 데에 영향을 주는데, PCIT를 이용하여 이를 조정한다. 어떻게 조정했을 때 적절한지를 판단하기 위해 오실로스코프를 이용하여 threshold를 설정했을 때 얼마나 유사한 파형을 가진다고 볼 수 있는지를 확인한다.\
이제 첫 실험을 진행한다. 이중 슬릿과 Blocker를 제거한 상태로 Detector만을 움직여 가면서 단일 광자들이 어떻게 측정되는지를 확인한다. 그 뒤, 극대 지점에 Detector를 세팅한 뒤에 blub의 세기를 5단계로 조절해 가면서 전구의 세기 변화를 측정하는 실험을 진행한다. \
이제 간섭과 관련된 실험을 진행하는데, 14호 슬릿 하나에 대해서만 실험을 진행한다. 14호 슬릿 두 구멍 중 하나를 Blocker로 가린 환경에서 실험을 진행한다. 그 뒤, blocker의 위치를 바꿔 빛이 이중 슬릿의 양쪽을 통과하도록 만든 뒤, 실험을 진행한다.

= Results

== Align

=== Position of Detector Slit

블로커 슬릿의 위치에 따른 Intensity를 측정한 결과는 아래 @blocker_pos 그래프와 같이 나타난다. 
#figure(
  image("images/blocker pos.png"),
  caption: [Graph of Intensity on Blocker Position]
) <blocker_pos>
위 실험에서 15호 슬릿이 상대적으로 매우 높은 전압 값을 가지는 것을 확인할 수 있었는데, 이는 Detector의 위치를 온전히 동일하게 맞추지 않은 상태에서 각각의 실험을 진행했기 때문인 것으로 보인다. 다만, 이 실험의 목적인 Blocker의 Align을 위한 최상단의 평평한 부분을 찾는 것은 매우 잘 이루어져 문제가 없는 것으로 보인다. 각 시행에서의 Blocker의 위치를 올바르게 구해낼 수 있었다. 

== LASER

=== Double Slit Interference

@blocker_pos 를 기반으로 하여 blocker가 이중 슬릿을 가리지 않도록 한 상태로 실험을 진행하니 아래 @laser_double_14, @laser_double_15, @laser_double_16 그래프와 같이 나타났다. 

#figure(
  image("images/laser 14.png"),
  caption: [Graph of Intensity of No.14 Slit with LASER]
) <laser_double_14>
#figure(
  image("images/laser 15.png"),
  caption: [Graph of Intensity of No.15 Slit with LASER]
) <laser_double_15>
#figure(
  image("images/laser 16.png"),
  caption: [Graph of Intensity of No.16 Slit with LASER]
) <laser_double_16>

각각의 그래프는 14호, 15호, 16호 슬릿에 대한 실험 결과를 나타내며, 각각의 슬릿에 대한 간섭 패턴을 잘 보여주고 있다. 각 그래프가 이론적인 식의 값과 잘 맞는지를 확인하기 위해 Matlab을 이용한 피팅을 진행하였다. 피팅을 위해 사용한 식은 @I_simple_cal 인데, 이 식에서 피팅을 위해 치환과 평행이동을 진행하였다. 이를 통해 세워진 식은 아래와 같다.
$
I(x) = I_0 ((sin (a_0(x-b_0))) / (a_0(x-b_0)))^2 cos^2(c_0(x-b_0)) + C_0
$

위 식에서의 @I_simple_cal 과의 차이는 x와 y방향 translation이 존재한다는 것이다. x방향 translation은 본 실험에서 Detector 슬릿의 위치가 0에서 중앙인 상황이 아니므로 필요하다. 다만, y방향 translation은 경험적으로 필요한 것으로 보이며, 측정 과정에서 생기는 오차로 인해 전체적인 세기가 증가하는 것으로 보인다. 이러한 이유로 y방향 translation인 $C_0$를 추가하였다. 각 그래프에서 $R^2$이 매우 좋게 측정되었으므로 좋은 예측을 수행한 것으로 볼 수 있다. 다만, photodiode는 오차가 매우 작은 것으로 알려져 있으므로, 이 근사를 이후에는 제거하여 더욱 더 상세한 분석을 수행할 필요가 있을 것으로 보인다. 



=== Single Slit Interference

이제는 단일 슬릿에 대한 실험을 진행하도록 한다. 여기서 @blocker_pos 에서의 정보를 이용하여 오른쪽과 왼쪽에 각각 생겨나는 평평한 부분을 찾아내어 해당 부분의 중앙에서 실험을 진행하도록 한다. 해당 부분이 이중 슬릿에서 한쪽 슬릿만이 가려진 상태로 볼 수 있기 때문이다. 실험 결과는 아래 @laser_single 그래프와 같이 나타난다.

#figure(
  image("images/laser single.png"),
  caption: [Graph of Intensity of Single Slit with LASER]
)<laser_single>

위 @laser_single 그래프에서 역시 Matlab을 활용한 피팅을 진행하였다. 우선 단일 슬릿에서의 이론 식은 위 @I_simple_cal 을 계산하는 과정에서 언급되었다시피 $((sin beta )/beta)^2$에 비례하도록 나타난다. 이 식을 피팅하기 위해 치환과 평행이동을 진행하였고, 이를 통해 세워진 식은 아래와 같다.

$
I(x) = I_0 ((sin (a_0(x-b_0))) / (a_0(x-b_0)))^2 + C_0
$

위 식을 통해 피팅을 진행하였으나, 본 실험에서는 detector가 움직이는 과정에서 슬릿의 끝자락에 도달하여 슬릿의 모서리 부분이 실제 photodiode를 가리지 못하는 상황에 도달하였다. 이에 따라 올바르지 않은 그래프가 나타나게 되었고, 이 부분을 제외하여 피팅을 진행하였다.

=== Asymmetric Double Slit Interference

이제는 비대칭 이중 슬릿 회절 실험을 진행하도록 한다. 이 실험에서는 Blocker의 위치를 조정하여 한쪽 슬릿만이 부분적으로 가려지도록 하여 실험을 진행한다. 실험 결과는 아래 @laser_asymm_data 그래프와 같이 나타난다.

#figure(
  image("images/asymm data.png"),
  caption: [Graph of Intensity of Asymmetric Double Slit with LASER]
) <laser_asymm_data>

#figure(
  image("images/asymm fitting sim.png"),
  caption: [Asymmetric Double Slit Interference with LASER]
) <laser_asymm>

위 @laser_asymm_data 그래프에서는 실험 결과를 나타냈다. 다만, 이론적인 식이 쉽게 세워지지는 않기 때문에 특별한 방법을 사용하여 @laser_asymm 과 같이 피팅을 진행할 수 있었다. 이 방법은 Discussion에서 다루도록 하겠다.

== Bulb

=== Driving Voltage Estimation

#figure(
  image("images/drive voltage.png"),
  caption: [Driving Voltage Estimation of PMT]
) <drive_voltage>

위 @drive_voltage 그래프는 PMT의 구동 전압을 조정하며 실험을 진행한 결과를 나타낸다. 이 그래프에서는 PMT의 구동 전압이 증가함에 따라 광자의 수가 증가하는 것을 확인할 수 있다. 이를 통해 PMT의 구동 전압을 조정하여 적절한 값을 찾아낼 수 있었다. 이에 Lower bound와 Upper bound 사이에 존재하는 550V를 구동 전압으로 설정하여 실험을 진행하였다.

=== Threshold Voltage Estimation

#figure(
  image("images/oscilloscope good.png"),
  caption: [Threshold Voltage Estimation of PMT with Oscilloscope - Good]
) <oscilloscope_good>

#figure(
  image("images/oscilloscope bad.png"),
  caption: [Threshold Voltage Estimation of PMT with Oscilloscope - Good]
) <oscilloscope_bad>

위 @oscilloscope_good 과 @oscilloscope_bad 그래프는 PMT의 threshold voltage를 조정하며 실험을 진행한 결과를 나타낸다. 위 @oscilloscope_bad 를 상세히 봤을 때 위의 그래프와 같이 신호가 명확하게 드러나지 않은 상태에서도 하단에 많은 신호가 보이는 것을 확인할 수 있을 것이다. 반면 @oscilloscope_good 를 상세히 봤을 때는 상단의 신호가 명확하게 드러났을 때 하단의 신호가 존재하는 경우에 명확하게 드러나는 것으로부터 좋은 threshold를 설정한 것으로 볼 수 있다. 이를 통해 실험을 진행할 때에는 좋은 threshold를 설정하여 진행하였다. 

=== Power Level of Bulb

#figure(
  image("images/bulb exp.png"),
  caption: [Number of Photons of Bulb on Power Level]
) <bulb_exp>

위 @bulb_exp 그래프는 전구의 세기를 조절하며 실험을 진행한 결과를 나타낸다. 이 그래프에서 전구의 세기가 증가함에 따라 광자의 수가 지수적으로 증가하는 것을 확인할 수 있으며 매우 급격하게 올라가는 것을 확인할 수 있었다. 이를 통해서 bulb의 power level이 4단과 5단인 경우로 맞추어 실험을 진행하는 것이 올바를 것이라고 예상할 수 있게 되었다.

=== Single Slit Interference

#figure(
  image("images/bulb single.png"),
  caption: [Single Slit Interference of No.14 Slit with Bulb]
) <bulb_single>

위 @bulb_single 은 위 @laser_single 과 유사한 환경에서 bulb에 대해 실험을 진행한 결과이다. 본 실험에서는 피팅을 @laser_single 과 동일한 방법으로 진행하였으나, PMT 장비 자체가 가지고 있는 오차가 photodiode와는 다르게 유의미하게 크기에 $C_0$ 값의 도입이 필수적이었다. 이를 통해 실험 결과를 분석하였다. 위 @laser_single 에서의 $R^2$ 값은 Left Slit에서 0.9731, Right Slit 에서 0.9996으로 나타나 매우 좋은 예측을 수행한 것으로 볼 수 있다.

=== Double Slit Interference


이중 슬릿에 대한 실험을 진행하도록 한다. 이 실험에서는 위 @laser_double_14 와 같이 14호 슬릿을 이용해 실험을 진행하였다. 위 @bulb_exp 에서 확인한 결과에 따라 bulb의 power level을 4와 5로 조정하여 각각 @bulb_double_4, @bulb_double_5 그래프와 같은 결과를 얻을 수 있었다.

#figure(
  image("images/bulb double 4.png"),
  caption: [Double Slit Interference of No.14 Slit with Bulb at Power Level 4]
) <bulb_double_4>

#figure(
  image("images/bulb double 5.png"),
  caption: [Double Slit Interference of No.14 Slit with Bulb at Power Level 5]
) <bulb_double_5>

위 실험 결과에서는 각각의 그래프에서 피팅을 진행하였는데, 이때 사용한 식은 @I_simple_cal 에서 위에서와 같이 상수항을 더해준 식이다. 이를 통해 실험 결과를 분석하였을 때에 그래프가 어느 정도 벗어난 모습을 보여주었는데, 이는 두 가지의 문제로 인한 것으로 생각된다. 우선 Single Slit Experiment에서의 결과에서 확인해 볼 수 있듯이 Align이 완벽하게 이루어지지 못해 양쪽이 어느 정도 비대칭임을 확인할 수 있었다. 또, 각 점에서 5번의 실험을 수행하여 그래프를 그렸는데, 실험 자체에서 가지는 오차가 매우 커 5번만으로 평균적으로 올바른 값을 뽑아낼 수 있다는 보장이 없는 것으로 보인다. 마지막으로, 본 피팅에서 사용한 식에서는 blocker를 고려하지 않았는데, blocker가 유의미한 영향을 주어 비대칭성을 만들어 냈을 가능성을 배제할 수 없다. 이러한 이유로 실험 결과가 이론적인 결과와 일치하지 않는 것으로 보인다.

= Discussion

== Linewidth

=== Linewidth of LASER

위 Introduction에서 Linewidth에 대해 논의했다시피 이 실험에서 사용하는 LASER는 linewidth를 가질 것이다. 이 점을 고려하여 피팅을 진행해보도록 한다. 우선 기본적으로 @I_with_linewidth 식을 이용하여 피팅을 진행하는 것이 목표이다. 또한, 본 피팅에서는 Photodiode의 오차가 매우 작다는 점을 고려해 $C_0$를 추가하지 않고 피팅을 진행하였다. 이를 통해 실험 결과에서 Linewidth가 한 역할을 보다 극적이게 확인할 수 있었다.

#figure(
  image("images/14 linewidth.png"),
  caption: [Double Slit Interference of No.14 Slit with Linewidth]
)

#figure(
  image("images/15 linewidth.png"),
  caption: [Double Slit Interference of No.15 Slit with Linewidth]
)

#figure(
  image("images/16 linewidth.png"),
  caption: [Double Slit Interference of No.16 Slit with Linewidth]
)

위 세 개의 그래프는 각각 14호, 15호, 16호 슬릿에 대한 실험 결과를 나타낸다. 각 그래프에서 모두 왼쪽 그래프는 linewidth를 고려하지 않은 그래프이고 오른쪽 그래프는 linewidth를 고려한 그래프이다. 이때 linewidth가 생기는 경우에 서로 다른 파장을 가지는 그래프들이 모두 일정 비율로 더해진 그래프이므로 간섭 무늬가 나타나는 과정에서 무늬와 무늬 사이 간격이 서로 다르게 된다. 이로 인해서 왼쪽의 그래프는 peak와 peak 사이에서 0에 도달하는 데에 반해 오른쪽의 그래프는 0에 도달하지 않게 된다. 이는 실제 실험에서 나타난 결과와 일치하는 것으로 보인다. 이 점을 통해 극소점에서의 값을 이용해 linewidth를 예측할 수 있다.

#figure(
  image("images/14 linewidth wavenumber.png"),
  caption: [Linewidth of LASER]
) <linewidth_laser>

이를 통해 예측한 linewidth는 @linewidth_laser 와 같이 나타난다. 여기서 회색으로 칠해진 영역이 FWHM을 나타내며, $3 times 10^(-4) "nm"^(-1)$의 파수 범위 내에 들어와야 하는 것으로 보인다. 이는 대략적으로 3% 정도의 오차로, 파장으로 환산했을 때에 20nm정도의 범위를 가지고 있을 것임을 확인할 수 있다. 이는 Techspin 사에서 제공한 LASER의 linewidth와 들어맞는 수치임을 확인할 수 있다 @techspin2012two-slit.

=== Linewidth of Bulb

이번에는 전구의 linewidth에 대해 알아보도록 한다. 이를 위해서 Bulb에서의 이중 슬릿 실험을 통해 얻은 그래프들을 linewidth를 고려한 식인 @I_with_linewidth 식을 이용하여 피팅을 진행하였다. 다만, 본 실험에서는 PMT가 유의미한 오차를 가지는 것을 @drive_voltage 에서 확인하였으므로 $C_0$를 추가하여 피팅을 진행하였다.

#figure(
  image("images/bulb without linewidth.png"),
  caption: [Double Slit Interference of No.14 Slit with Bulb at Power Level 5 without Linewidth]
) <bulb_no_linewidth>
#figure(
  image("images/bulb with linewidth.png"),
  caption: [Double Slit Interference of No.14 Slit with Bulb at Power Level 5 with Linewidth]
) <bulb_linewidth>

위 @bulb_no_linewidth 와 @bulb_linewidth 그래프는 각각 linewidth를 고려하지 않은 그래프와 고려한 그래프를 나타낸다. 그러나 본 상황에서는 laser에서와 다르게 PMT의 오차로 인해 peak 와 peak 사이에 0에 도달하지 않으며, 이로 인해 linewidth를 추정하는 것이 어려워졌다. 또, 그래프 자체가 매우 불규칙적이기에 미세한 오차에서 예측할 수 있는 linewidth를 합당하게 예측하는 것이 매우 어렵다는 것을 알 수 있다. 그러나 여전히 bulb의 linewidth를 예측해 보도록 하면 아래와 같은 그래프를 얻을 수 있다.

#figure(
  image("images/bulb linewidth wavenumber.png"),
  caption: [Linewidth of Bulb]
) <linewidth_bulb>

위 그래프에서 중앙에 해당하는 파장의 값은 513.2nm로 techspin에서 제공한 값과 유사하지만 조금 다름을 확인할 수 있었다 @techspin2012two-slit. 또, bulb가 laser보다 더 FWHM이 넓을 것으로 기대되지만 이를 확인할 수 없어 더욱 더 정확한 실험을 수행하여 더 심도있게 분석을 수행할 필요가 있을 것으로 보인다.


== Theoretical Calculation

위에서 언급했다시피, 본 실험에서의 장비는 이중 슬릿만을 이용한 실험과 유의미한 차이점을 가지기에 @hogan2008radiation 의 시뮬레이션을 이용할 수 없다. 따라서 새로운 이론적인 계산을 Huygens-Fresnel 원리와 맥스웰의 방정식을 이용하여 진행한다.
우선 @materials 에서 설명한 실험장치에서 변수를 아래 @parameters 와 같이 설정하도록 한다.

#figure(
  image("images/Parameters.png", width: 100%),
  caption: [Figure of the materials with parameters],
)<parameters>

우선 위 실험장치에서 Source 부분은 잘 Align되어 있다고 가정한다. 이때 Double Slit 부분에서 각 Slit 위에서의 위치는 Source Slit 기준으로 거의 동일하다고 볼 수 있다. 이에 각 Slit 위에서의 전기장이 모두 $E_0$로 동일하다고 가정한다. 그러면 Blocker Slit 위에서의 전기장은 아래와 같이 주어진다.
$
E_("Blocker")(y) = E_0 integral_(p_1)^(p_1+w_1) exp(i k sqrt(x_1^2+(y-y_1)^2)) / sqrt(x_1^2+(y-y_1)^2) d y_1 \
+ E_0 integral_(p_2)^(p_2+w_2) exp(i k sqrt(x_1^2+(y-y_2)^2)) / sqrt(x_1^2+(y-y_2)^2) d y_2
$
여기서 $p_1, p_2$는 이중 슬릿에서 각 슬릿 구멍의 시작 위치이고, $w_1, w_2$는 각 슬릿의 너비이다. 모든 $y$는 장비 평면에서의 위치를 의미한다. 같은 방식으로 Detector Slit 위에서의 전기장은 아래와 같이 계산될 수 있다.
$
E_("Detector")(y) = integral_(p_3)^(p_3+w_3) E_("Blocker")(y_3) \
exp(i k sqrt(x_2^2+(y-y_3)^2)) / sqrt(x_2^2+(y-y_3)^2) d y_3
$
위 식에 Blocker 슬릿에 대한 계산을 대입한 뒤, 세기를 계산하기 위해 Detector Slit 위에서의 전기장의 크기의 제곱을 적분한 결과를 계산할 수 있을 것이다. 이를 수행하면 아래와 같이 주어진다.
$
I_("Detector")(p_4) = |E_0|^2 integral_(p_4)^(p_4+w_4) lr(| integral_(p_3)^(p_3+w_3) [ \
  integral_(p_1)^(p_1+w_1) exp(i k sqrt(x_1^2+(y_3-y_1)^2)) / sqrt(x_1^2+(y_3-y_1)^2) d y_1 \
+ integral_(p_2)^(p_2+w_2) exp(i k sqrt(x_1^2+(y_3-y_2)^2)) / sqrt(x_1^2+(y_3-y_2)^2) d y_2
] \
 exp(i k sqrt(x_2^2+(y_4-y_3)^2)) / sqrt(x_2^2+(y_4-y_3)^2) d y_3|)""^2 d y_4
$
본 실험에서 우리는 위 $I_("Detector")(p_4)$의 그래프를 얻는 과정을 수행한다. 이 과정을 이용하면 실험 결과를 보다 상세하게 분석할 수 있으나 이 위 식은 매우 복잡한 계산을 필요로 하기에 이를 수행하기 위해서는 많은 컴퓨팅 자원이 필요하다. 아래 Appendix에서 이를 수행하기 위해 사용한 컴퓨팅 자원과 방법을 간략하게 소개한다. 이 과정을 통해서 얻은 결과는 @laser_asymm 과 같은 그래프이다. 이 시뮬레이션 자체의 합당함을 검증하기 위해 비교적 간단한 blocker position을 시뮬레이션 해 보았다.

#figure(
  image("images/blocker pos sim.png"),
  caption: [Simulated Intensity on Blocker Position]
) <simulated>

위 @simulated 그래프는 실제 실험 결과와 매우 유사한 모양을 띄고 있으며, Detector를 고의적으로 약간 벗어나게 위치했을 때에 나타나는 특징인 중간 평평한 부분이 level이 맞지 않는 현상까지 확인할 수 있었다. 본 시뮬레이션에서 특이적인 점은, 실제 실험 결과에서 발생했던 평평한 부분에서 일시적으로 급격하게 상승하는 현상이 발생하는 것까지 확인할 수 있었다. 이는 실험 결과에서 발생했던 현상을 매우 잘 설명하는 것으로 보인다. 이를 통해 본 시뮬레이션이 합당함을 확인할 수 있다.

= Conculsion

본 보고서에서는 LASER와 Bulb에 대해서 각각 single slit과 double slit의 Interference 실험을 진행하였다. 또, 이를 이론적인 수치와 비교하는 것으로 실험이 잘 진행되었는지를 검증하고, 알려진 이론이 현실에 잘 들어맞는 것을 확인할 수 있었다. 또, 일정 부분 벗어난 점을 linewidth에 대한 분석을 통해 보정하였으며, 복잡한 적분을 통해 보다 원론적인 방법으로 실험 결과를 예측할 수 있음을 확인하였다.

#bibliography("reference.bib", full:true, style: "american-physics-society")

= Appendix

본 보고서에서 적분을 수반하는 피팅을 하기 위해 사용한 서버는 NVIDIA A40 48GB, 16 vCPUs, 64 GB Memory를 가지도록 세팅하였다. 구현을 위해서 PyTorch 라이브러리를 활용하였으며, optimizer로는 Adam을 활용하였다. 적분 방법으로는 Trapezoidal Rule을 사용하였으며, 적분 과정에서 수치는 complex128로 취급하였다. 다만, 위에서 세운 식이 torch의 autograd 함수로 미분하였을 때에 적절한 값을 얻기 어려운 경우가 많으며, 보다 정확한 계산을 위해 많은 간격을 두고 적분을 수행하는 경우에 부동소수점 오차가 누적되는 구조를 가지고 있어 본 오차를 줄여 개선하기 위해서는 직접 위 식을 미분하여 gradient 함수를 계산해 두는 것이 적절할 것으로 보인다.