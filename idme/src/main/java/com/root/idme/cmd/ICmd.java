package com.root.idme.cmd;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dto.Members;

@Service
public interface ICmd {
	void execute(Model model);
	Members execute(String id, String pwd);
}
