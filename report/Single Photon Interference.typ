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


= Experimental Methods



= Results

= Discussion

= Conculsion


#bibliography("reference.bib", full:true, style: "american-physics-society")