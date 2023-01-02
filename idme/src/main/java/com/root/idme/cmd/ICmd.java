package com.root.idme.cmd;

import org.springframework.ui.Model;

import com.root.idme.dto.Members;

public interface ICmd {
	void execute(Model model);
	Members execute(String id, String pwd);
}
