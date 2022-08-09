package com.shop.fashion.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Menu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable = false)
	private Integer sortNum;
	@Column(nullable = false)
	private String menuName;
	@Column(nullable = false)
	private String address;
	@Column(nullable = false)
	private Integer role;
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "subMenuId")
	private List<SubMenu> subMenu;
}
