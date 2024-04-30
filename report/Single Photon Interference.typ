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

본 실험에서의 목적은 영의 이중 슬릿 실험을 단일 광자를 이용해서 재현하는 것이기에 이중 슬릿을 이용한 계산을 R. Hogan의 연구 결과를 이용할 수 있을 것으로 기대하였으나, 본 실험에서 사용한 Techspin사의 "Two-Slit Interference, One Photon at a Time" @techspin2012two-slit 은 보다 많은 슬릿을 이용해 실험 결과를 얻을 수 밖에 없어 새로운 이론적인 계산이 필요했다.

= Experimental Methods

본 실험을 위해서 Techspin 사의 "Two-Slit Interference, One Photon at a Time"을 사용하였다 @techspin2012two-slit. 이 실험장치는 아래 @materials 와 같은 구성으로 이루어져 있다.

#figure(
  image("images/Materials.png", width: 100%),
  caption: [Figure of the materials for the Experiment @techspin2012two-slit],
)<materials>

기본적으로 실험은 Source에서 나온 광자를 Double Slit을 통과시키며 간섭을 일으키고, 여기서의 간섭 결과를 Detector Slit을 통과시키며 빛의 세기(광자의 수)를 측정한다. 이때 Detector Slit의 위치를 이동해 가며 빛의 세기를 측정하면 각 위치에서의 세기를 얻어 간섭 결과를 얻을 수 있다.

== LASER



== BULB

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

= Discussion

= Conculsion


#bibliography("reference.bib", full:true, style: "american-physics-society")

= Appendix

