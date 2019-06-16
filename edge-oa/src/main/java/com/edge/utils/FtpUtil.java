package com.edge.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class FtpUtil {

	/**
	 * 获取FTPClient对象
	 *
	 * @param ftpHost
	 *            FTP主机服务器
	 * @param ftpPassword
	 *            FTP 登录密码
	 * @param ftpUserName
	 *            FTP登录用户名
	 * @param ftpPort
	 *            FTP端口 默认为21
	 * @return
	 */
	public static FTPClient getFTPClient(String ftpHost, String ftpUserName, String ftpPassword, int ftpPort) {
		FTPClient ftpClient = new FTPClient();

		try {
			ftpClient = new FTPClient();
			ftpClient.connect(ftpHost, ftpPort);// 连接FTP服务器
			ftpClient.login(ftpUserName, ftpPassword);// 登陆FTP服务器
			if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
				System.out.println("未连接到FTP，用户名或密码错误。");
				ftpClient.disconnect();
			} else {
				System.out.println("FTP连接成功。");
			}
		} catch (SocketException e) {
			e.printStackTrace();
			System.out.println("FTP的IP地址可能错误，请正确配置。");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("FTP的端口错误,请正确配置。");
		}
		return ftpClient;
	}

	/**
	 * 下载文件
	 * 
	 * @param ftpHost
	 * @param ftpUserName
	 * @param ftpPassword
	 * @param ftpPort
	 * @param ftpPath
	 * @param localPath
	 * @param fileName
	 */
	public static boolean downloadFtpFile(String ftpHost, String ftpUserName, String ftpPassword, int ftpPort,
			String ftpPath, String localPath, String fileName, String newName) {
		boolean success = false;
		FTPClient ftpClient = null;

		try {
			ftpClient = getFTPClient(ftpHost, ftpUserName, ftpPassword, ftpPort);
			ftpClient.setControlEncoding("UTF-8"); // 中文支持
			ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
			ftpClient.enterLocalPassiveMode();
			ftpClient.changeWorkingDirectory(ftpPath);
			File localFile = new File(localPath + File.separatorChar + fileName);// 上传前文件
			String realName=localPath+newName;
			File newFile = new File(realName);// 修改名称后的文件
			OutputStream os = new FileOutputStream(localFile);
			ftpClient.retrieveFile(fileName, os);
			os.close();
			localFile.renameTo(newFile); //改名
			ftpClient.logout();
			success = true;

		} catch (FileNotFoundException e) {
			System.out.println("没有找到" + ftpPath + "文件");
			e.printStackTrace();
		} catch (SocketException e) {
			System.out.println("连接FTP失败.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("文件读取错误。");
			e.printStackTrace();
		}

		return success;
	}

	/**
	 * Description: 向FTP服务器上传文件
	 * 
	 * @param ftpHost
	 *            FTP服务器hostname
	 * @param ftpUserName
	 *            账号
	 * @param ftpPassword
	 *            密码
	 * @param ftpPort
	 *            端口
	 * @param ftpPath
	 *            FTP服务器中文件所在路径 格式： ftptest/aa
	 * @param fileName
	 *            ftp文件名称
	 * @param input
	 *            文件流
	 * @return 成功返回true，否则返回false
	 */
	public static boolean uploadFile(String ftpHost, String ftpUserName, String ftpPassword, int ftpPort,
			String ftpPath, String fileName, InputStream input) {
		boolean success = false;
		FTPClient ftpClient = null;
		try {
			int reply;
			ftpClient = getFTPClient(ftpHost, ftpUserName, ftpPassword, ftpPort);
			// 先创建文件存放路径
			reply = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftpClient.disconnect();
				return success;
			}
			createDir(ftpPath, ftpClient);
			ftpClient.setControlEncoding("UTF-8"); // 中文支持
			ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
			ftpClient.enterLocalPassiveMode();
			ftpClient.changeWorkingDirectory(ftpPath);
			ftpClient.storeFile(fileName, input);
			input.close();
			ftpClient.logout();
			success = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.disconnect();
				} catch (IOException ioe) {
				}
			}
		}
		return success;
	}

	// 创建多层目录文件，如果有ftp服务器已存在该文件，则不创建，如果无，则创建
	public static void createDir(String dir, FTPClient ftp) {
		String year = dir.substring(0, 5);
		String month = dir.substring(0, 8);
		String day = dir.substring(0, 11);
		try {
			ftp.makeDirectory(year);
			ftp.makeDirectory(month);
			ftp.makeDirectory(day);
			System.out.println("在目标服务器上成功建立了文件夹: " + dir);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}