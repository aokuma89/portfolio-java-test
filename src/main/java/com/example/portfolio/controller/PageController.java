package com.example.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.portfolio.entity.Item;
import com.example.portfolio.repository.CategoryRepository;
import com.example.portfolio.repository.ItemRepository;

@Controller
public class PageController {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private ItemRepository itemRepository;

	@GetMapping("/")
	public String showItemList(Model model) {
		model.addAttribute("items", itemRepository.findAll());
		return "index";
	}

	@GetMapping("/items/new")
	public String showNewItemForm(Model model) {
		model.addAttribute("item", new Item());
		model.addAttribute("categories", categoryRepository.findAll());
		return "items_new";
	}

	@PostMapping("/items")
	public String saveItem(@ModelAttribute Item item) {
		itemRepository.save(item);
		return "redirect:/";
	}
}
