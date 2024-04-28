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

1807년 T. Young은 자신의 강의에서 이중 슬릿 실험을 설명하였다 @young1807course. 이 이중 슬릿 실험 실험 결과는 빛이 파동임을 입증하였고, 이후 1864년 J. Maxwell이 전자기파에 관한 이론을 정립하며 빛이 전자기파라는 파동임이 널리 알려졌다 @maxwell1864ii. 그러나 1905년 A. Einstein은 광전효과에 관한 논문에서 광양자 가설을 제시하였고@einstein1905heuristic, 이후 1916년 R. Millikan에 의해 실험적으로 검증되었으며@millikan1916direct@millikan1916einstein, A. Compton이 1923년 콤프턴 산란을 발표하며 빛의 입자성이 입증되었다 @compton1923quantum. 그러나 여전히 T. Young의 실험 결과는 유효하므로 광자라는 입자는 파동성을 가지며, 스스로 간섭을 일으킬 수 있다는 것을 유추할 수 있다. 실제로 1987년 P. Grangier 등 단일 광자 간섭 실험을 통해 이를 입증하였으며, 많은 연구자들이 이 실험들을 재현하였다@grangier1986experimental @luo2024young @kim2023revisiting. 우리는 이 실험에서 이 현상을 검증하고자 한다.

== Huygens-Fresnel Principle

1690년 C. Huygens는 파동의 진행을 설명하기 위해 Huygens-Fresnel 원리를 제시하였다 @huygens1690traité. 이 원리는 각 점에서 파동이 진행할 때, 그 점을 중심으로 작은 구를 생각하고, 그 구면에서 파동이 진행하는 것으로 가정한다. A. Fresnel은 이 원리를 발전시켜 파동의 간섭을 설명하였다 @fresnel1819memoire. 이 이론은 이중 슬릿 실험을 통해 실험적으로 검증되었으며, 이후 많은 실험에서 유효함이 입증되었다. 이 실험에서는 Huygens-Fresnel 원리를 통해 이중 슬릿 간섭을 설명하고자 한다.

= Experimental Methods

본 실험을 위해서 Techspin 사의 "Two-Slit Interference, One Photon at a Time"을 사용하였다 @techspin2012two-slit. 이 실험장치는 다음과 같은 구성으로 이루어져 있다.

== LASER

== BULB

= Results

= Discussion

= Conculsion


#bibliography("reference.bib", full:true, style: "american-physics-society")