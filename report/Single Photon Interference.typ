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
  abstract: "서론 열심히 쓰길"+"\n"+text(weight: "bold")[Keywords: ]
  +"",
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

== Line Width of LASER

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

= Theoretical Calculation

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
본 실험에서 우리는 위 $I_("Detector")(p_4)$의 그래프를 얻는 과정을 수행한다.
= Results

== Align

=== Position of Detector Slit

블로커 슬릿의 위치에 따른 Intensity를 측정한 결과는 아래 그래프와 같이 나타난다. 
#figure(
  image("images/blocker pos.png"),
  caption: []
)

== LASER

=== Double Slit Interference

#figure(
  image("images/laser 14.png"),
  caption: []
)
#figure(
  image("images/laser 15.png"),
  caption: []
)
#figure(
  image("images/laser 16.png"),
  caption: []
)


=== Single Slit Interference

#figure(
  image("images/laser single.png"),
  caption: []
)

=== Asymmetric Double Slit Interference

#figure(
  image("images/asymm fitting sim.png"),
  caption: []
)

=== Linewidth of LASER

#figure(
  image("images/14 linewidth.png"),
  caption: []
)

#figure(
  image("images/15 linewidth.png"),
  caption: []
)

#figure(
  image("images/16 linewidth.png"),
  caption: []
)

#figure(
  image("images/14 linewidth wavenumber.png"),
)

== Bulb

=== Driving Voltage Estimation

#figure(
  image("images/drive voltage.png"),
  caption: []
)

=== Threshold Voltage Estimation

#figure(
  image("images/oscilloscope good.png"),
  caption: []
)

#figure(
  image("images/oscilloscope bad.png"),
  caption: []
)

=== Power Level of Bulb

#figure(
  image("images/bulb exp.png"),
  caption: []
)

=== Single Slit Interference

#figure(
  image("images/bulb single.png"),
  caption: []
)

=== Double Slit Interference

#figure(
  image("images/bulb double 4.png"),
  caption: []
)

#figure(
  image("images/bulb double 5.png"),
  caption: []
)

= Discussion

= Conculsion


#bibliography("reference.bib", full:true, style: "american-physics-society")

= Appendix

== Technical Details
복잡한 학습을 위해 사용한 컴퓨터는 Cudo Compute 