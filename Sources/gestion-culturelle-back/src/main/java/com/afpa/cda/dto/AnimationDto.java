package com.afpa.cda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AnimationDto {
	private int id;
	private String label;
	private String type;
	private int prix;
	private int nbreSpectateursPrevus;
}
