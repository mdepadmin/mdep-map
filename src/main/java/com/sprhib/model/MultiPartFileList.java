package com.sprhib.model;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class MultiPartFileList {
	ArrayList<MultipartFile> files;

	public ArrayList<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(ArrayList<MultipartFile> files) {
		this.files = files;
	}
	
}
