package com.edge.utils;
import java.io.File;  
import java.io.FileNotFoundException;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;  
import java.util.Vector;  
  
import org.apache.commons.io.IOUtils;  

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
  

/**
 *  sftp������
 */
public class SFTPUtil {
    private ChannelSftp sftp;  
            
    private Session session;  
    /** SFTP ��¼�û���*/    
    private String username;
    /** SFTP ��¼����*/    
    private String password;  
    /** ˽Կ */    
    private String privateKey;  
    /** SFTP ��������ַIP��ַ*/    
    private String host;  
    /** SFTP �˿�*/  
    private int port;  
            
        
    /**  
     * �������������֤��sftp����  
     */    
    public SFTPUtil(String username, String password, String host, int port) {  
        this.username = username;  
        this.password = password;  
        this.host = host;  
        this.port = port;  
    }
        
    /**  
     * ���������Կ��֤��sftp����
     */  
    public SFTPUtil(String username, String host, int port, String privateKey) {  
        this.username = username;  
        this.host = host;  
        this.port = port;  
        this.privateKey = privateKey;  
    }  
        
    public SFTPUtil(){}  
    
    
    /**
     * ����sftp������
     */  
    public void login(){  
        try {  
            JSch jsch = new JSch();  
            if (privateKey != null) {  
                jsch.addIdentity(privateKey);// ����˽Կ  
            }  
    
            session = jsch.getSession(username, host, port);  
           
            if (password != null) {  
                session.setPassword(password);    
            }  
            Properties config = new Properties();  
            config.put("StrictHostKeyChecking", "no");  
                
            session.setConfig(config);  
            session.connect();  
              
            Channel channel = session.openChannel("sftp");  
            channel.connect();  
    
            sftp = (ChannelSftp) channel;  
        } catch (JSchException e) {  
            e.printStackTrace();
            System.out.println("SFTP����ʧ��!!");
        }  
    }    
    
    /**
     * �ر����� server  
     */  
    public void logout(){  
        if (sftp != null) {  
            if (sftp.isConnected()) {  
                sftp.disconnect();  
            }  
        }  
        if (session != null) {  
            if (session.isConnected()) {  
                session.disconnect();  
            }  
        }  
    }  
 
    
    /**  
     * ���������������ϴ���sftp��Ϊ�ļ����ļ�����·��=basePath+directory
     * @param basePath  �������Ļ���·��
     * @param directory  �ϴ�����Ŀ¼  
     * @param sftpFileName  sftp���ļ���  
     * @param in   ������  
     */  
    public void upload(String basePath,String directory, String sftpFileName, InputStream input) throws SftpException{  
        try {   
            sftp.cd(basePath);
            sftp.cd(directory);  
        } catch (SftpException e) {
            //Ŀ¼�����ڣ��򴴽��ļ���
            String [] dirs=directory.split("/");
            String tempPath=basePath;
            for(String dir:dirs){
                if(null== dir || "".equals(dir)) continue;
                tempPath+="/"+dir;
                try{
                    sftp.cd(tempPath);
                }catch(SftpException ex){
                    sftp.mkdir(tempPath);
                    sftp.cd(tempPath);
                }
            }
        }  
        sftp.put(input, sftpFileName);  //�ϴ��ļ�
    }
    
 
    /**
     * �����ļ���
     * @param directory ����Ŀ¼  
     * @param downloadFile ���ص��ļ�
     * @param saveFile ���ڱ��ص�·��
     */    
    public void download(String directory, String downloadFile, String saveFile) throws SftpException, FileNotFoundException{  
        if (directory != null && !"".equals(directory)) {  
            sftp.cd(directory);  
        }  
        File file = new File(saveFile);  
        sftp.get(downloadFile, new FileOutputStream(file));  
    }  
    
    /**  
     * �����ļ�
     * @param directory ����Ŀ¼
     * @param downloadFile ���ص��ļ���
     * @return �ֽ�����
     */  
    public byte[] download(String directory, String downloadFile) throws SftpException, IOException{  
        if (directory != null && !"".equals(directory)) {  
            sftp.cd(directory);  
        }  
        InputStream is = sftp.get(downloadFile);  
          
        byte[] fileData = IOUtils.toByteArray(is);  
          
        return fileData;  
    }  
    
    
    /**
     * ɾ���ļ�
     * @param directory Ҫɾ���ļ�����Ŀ¼
     * @param deleteFile Ҫɾ�����ļ�
     */  
    public void delete(String directory, String deleteFile) throws SftpException{  
        sftp.cd(directory);  
        sftp.rm(deleteFile);  
    }  
    
    
    /**
     * �г�Ŀ¼�µ��ļ�
     * @param directory Ҫ�г���Ŀ¼
     * @param sftp
     */  
    public Vector<?> listFiles(String directory) throws SftpException {  
        return sftp.ls(directory);  
    }  
      
 
    /**
     * �����ļ�
     * @param username
     * @param password
     * @param host
     * @param port
     * @param directory ����Ŀ¼ 
     * @param downloadFile ���ص��ļ�
     * @param saveFile ����ļ���·��
     */
    public static boolean downloadFtpFile(String username, String password,String host, int port, 
    						String directory, String downloadFile,String saveFile) {
    	boolean success = false;
     
        SFTPUtil sftp = new SFTPUtil(username, password, host, port); 
        //sftp��½
    	sftp.login();  
        //�����ļ� 
        try {
			sftp.download(directory,downloadFile,saveFile);
			System.out.println("�����ļ��ɹ�");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("û���ҵ�" + downloadFile + "�ļ�");
		} catch (SftpException e) {
			e.printStackTrace();
			System.out.println("����SFTPʧ��!");
		}  
        sftp.logout();  
        success = true;
      
        return success;
    }
    

  //���ɸ�����
  	private static String getDateNum() {
  		Date d = new Date();
  		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
  		String format = sdf.format(d);
  		String s = format
  				+ ((int) ((Math.random() * 9 + 1) * 1000) + "_" + ((int) ((Math
  						.random() * 9 + 1) * 10) + ""));
  		return s;
  	}
  	
  	/**
     * ���Է���
     */
    public static void main(String[] args) {
    	String downloadFile ="";
    	//���ر��ش���ļ�Ŀ¼
    	String localPath = "/home/weblogic/bea/upload/form";
    	Date time = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    	//�����ļ���׺
    	String suffix = downloadFile.substring(downloadFile.lastIndexOf("."));
        localPath = localPath + File.separator + sdf.format(time);
        File file = new File(localPath);
        if(!file.exists()){
        	file.mkdirs();
        }
        String pro_attach_addr = localPath + File.separator+getDateNum()+ suffix;
    	System.out.println("���ش��·��Ϊ��"+pro_attach_addr);
        SFTPUtil sftp = new SFTPUtil("jscrmitsm", "chenpeng#789!", "132.228.236.49", 9100);  
        //sftp��½
    	sftp.login();  
    	System.out.println("��¼�ɹ�");
        //�����ļ� 
        try {
			sftp.download("/log",downloadFile,pro_attach_addr);
			System.out.println("�ļ����سɹ�");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("û���ҵ�" + downloadFile + "�ļ�");
		} catch (SftpException e) {
			e.printStackTrace();
			System.out.println("����SFTPʧ��!");
		}  
        sftp.logout();  
        System.out.println("������������");
 
      
	}
    	
}
