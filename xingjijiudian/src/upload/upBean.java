// Decompiled Using: FrontEnd Plus v2.03 and the JAD Engine
// Available From: http://www.reflections.ath.cx
// Decompiler options: packimports(3) 
// Source File Name:   upBean.java

package upload;

import java.io.IOException;
import java.io.InputStream;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

// Referenced classes of package xiaoxiang.fileUpload:
//            files, Request, file

public class upBean
{

    public upBean()
    {
        m_files = new files();
        m_totalBytes = 0;
        m_currentIndex = 0;
        m_startData = 0;
        m_endData = 0;
        m_boundary = new String();
        m_totalMaxFileSize = 0L;
        m_maxFileSize = 0L;
        m_allowedExtList = new Vector();
        m_allowedFileTypeList = new Vector();
        m_formRequest = new Request();
        m_count = 0;
        isCover = true;
        realPath = new String();
    }

    public final void initialize(PageContext pagecontext)
        throws ServletException
    {
        m_application = pagecontext.getServletContext();
        m_request = (HttpServletRequest)pagecontext.getRequest();
        m_response = (HttpServletResponse)pagecontext.getResponse();
    }

    /**
     * @deprecated Method setRealPath is deprecated
     */

    public void setRealPath(String pRealPath)
    {
        realPath = pRealPath;
    }

    public String getRealPath()
    {
        return realPath;
    }

    public void setIsCover(boolean pIsCover)
    {
        isCover = pIsCover;
    }

    public void upload()
        throws ServletException, IOException, Exception
    {
        int i = 0;
        long maxSize = 0L;
        boolean isBoundaryEnd = false;
        String sFileName = new String();
        String fileExtName = new String();
        String dataFieldValue = new String();
        String contentType = new String();
        String typeMIME = new String();
        String subTypeMIME = new String();
        m_totalBytes = m_request.getContentLength();
        m_binArray = new byte[m_totalBytes];
        int j;
        for(; i < m_totalBytes; i += j)
            try
            {
                m_request.getInputStream();
                j = m_request.getInputStream().read(m_binArray, i, m_totalBytes - i);
            }
            catch(Exception exception)
            {
                throw new Exception("Unable to upload.");
            }

        for(; !isBoundaryEnd && m_currentIndex < m_totalBytes; m_currentIndex++)
            if(m_binArray[m_currentIndex] == 13)
                isBoundaryEnd = true;
            else
                m_boundary += (char)m_binArray[m_currentIndex];

        if(m_currentIndex == 1)
            return;
        for(m_currentIndex++; m_currentIndex < m_totalBytes; m_currentIndex += 2)
        {
            String dataHeader = getDataHeader();
            m_currentIndex += 2;
            boolean isFileObject = dataHeader.indexOf("filename") > 0;
            String fieldName = getDataFieldValue(dataHeader, "name");
            if(isFileObject)
            {
                dataFieldValue = getDataFieldValue(dataHeader, "filename");
                sFileName = getFileName(dataFieldValue);
                fileExtName = getFileExt(sFileName);
                contentType = getContentType(dataHeader);
                typeMIME = getTypeMIME(contentType);
                subTypeMIME = getSubTypeMIME(contentType);
            }
            getDataSection();
            m_size = (m_endData - m_startData) + 1;
            if(isFileObject && sFileName.length() > 0)
            {
                if(!m_allowedExtList.isEmpty() && !m_allowedExtList.contains(fileExtName))
                    throw new SecurityException("\u60A8\u7684\u6587\u4EF6\u540E\u7F00\u540D\u4E0D\u7B26\u5408\u6211\u4EEC\u7684\u8BBE\u5B9A.\u6211\u4EEC\u53EA\u5141\u8BB8\u4EE5\u4E0B\u540E\u7F00\u540D\u7684\u6587\u4EF6\uFF1A" + m_allowedExtList.toString());
                if(!m_allowedFileTypeList.isEmpty() && !m_allowedFileTypeList.contains(subTypeMIME))
                    throw new SecurityException("\u60A8\u7684\u6587\u4EF6\u7C7B\u578B\u4E0D\u7B26\u5408\u6211\u4EEC\u7684\u8BBE\u5B9A.\u6211\u4EEC\u53EA\u5141\u8BB8\u4EE5\u4E0B\u7C7B\u578B\u7684\u6587\u4EF6\uFF1A" + m_allowedFileTypeList.toString());
                if(m_maxFileSize > 0L && (long)((m_endData - m_startData) + 1) > m_maxFileSize)
                    throw new SecurityException("\u60A8\u4E0A\u4F20\u7684\u8FD9\u4E2A\u6587\u4EF6\u8D85\u8FC7\u4E86\u6211\u4EEC\u7684\u9650\u5236 : " + sFileName + ".\u6587\u4EF6\u7684\u5355\u4E2A\u5927\u5C0F\u5E94\u5C0F\u4E8E" + (m_maxFileSize / 1000L + 1L) + "kb");
                maxSize += (m_endData - m_startData) + 1;
                if(m_totalMaxFileSize > 0L && maxSize > m_totalMaxFileSize)
                    throw new SecurityException("\u60A8\u4E0A\u4F20\u7684\u6587\u4EF6\u603B\u5927\u5C0F\u8D85\u8FC7\u4E86\u6211\u4EEC\u7684\u9650\u5236:" + (m_totalMaxFileSize / 1000L + 1L) + "kb");
                m_files.addFile(new file(sFileName, m_startData, (m_endData - m_startData) + 1, m_count, subTypeMIME, this));
                m_count++;
            }
            if(!isFileObject)
            {
                String s11 = new String(m_binArray, m_startData, (m_endData - m_startData) + 1);
                m_formRequest.putParameter(fieldName, s11);
            }
            if((char)m_binArray[m_currentIndex + 1] == '-')
                break;
        }

    }

    private String getDataFieldValue(String s, String s1)
    {
        String s2 = new String();
        String s3 = new String();
        int i = 0;
        boolean flag = false;
        boolean flag1 = false;
        boolean flag2 = false;
        s2 = s1 + "=" + '"';
        i = s.indexOf(s2);
        if(i > 0)
        {
            int j = i + s2.length();
            int k = j;
            s2 = "\"";
            int l = s.indexOf(s2, j);
            if(k > 0 && l > 0)
                s3 = s.substring(k, l);
        }
        return s3;
    }

    private String getFileExt(String s)
    {
        String s1 = new String();
        int i = 0;
        int j = 0;
        if(s == null)
            return null;
        i = s.lastIndexOf('.') + 1;
        j = s.length();
        s1 = s.substring(i, j);
        if(s.lastIndexOf('.') > 0)
            return s1;
        else
            return "";
    }

    private String getContentType(String s)
    {
        String s1 = new String();
        String s2 = new String();
        int i = 0;
        boolean flag = false;
        s1 = "Content-Type:";
        i = s.indexOf(s1) + s1.length();
        if(i != -1)
        {
            int j = s.length();
            s2 = s.substring(i, j);
        }
        return s2;
    }

    private String getTypeMIME(String s)
    {
        String s1 = new String();
        int i = 0;
        i = s.indexOf("/");
        if(i != -1)
            return s.substring(1, i);
        else
            return s;
    }

    private String getSubTypeMIME(String s)
    {
        String s1 = new String();
        int i = 0;
        boolean flag = false;
        i = s.indexOf("/") + 1;
        if(i != -1)
        {
            int j = s.length();
            return s.substring(i, j);
        } else
        {
            return s;
        }
    }

    private void getDataSection()
    {
        boolean flag = false;
        String s = new String();
        int i = m_currentIndex;
        int j = 0;
        int k = m_boundary.length();
        m_startData = m_currentIndex;
        m_endData = 0;
        while(i < m_totalBytes) 
            if(m_binArray[i] == (byte)m_boundary.charAt(j))
            {
                if(j == k - 1)
                {
                    m_endData = ((i - k) + 1) - 3;
                    break;
                }
                i++;
                j++;
            } else
            {
                i++;
                j = 0;
            }
        m_currentIndex = m_endData + k + 3;
    }

    private String getDataHeader()
    {
        int i = m_currentIndex;
        int j = 0;
        boolean flag = false;
        for(boolean flag1 = false; !flag1;)
            if(m_binArray[m_currentIndex] == 13 && m_binArray[m_currentIndex + 2] == 13)
            {
                flag1 = true;
                j = m_currentIndex - 1;
                m_currentIndex += 2;
            } else
            {
                m_currentIndex++;
            }

        String s = new String(m_binArray, i, (j - i) + 1);
        return s;
    }

    private String getFileName(String s)
    {
        String s1 = new String();
        String s2 = new String();
        int i = 0;
        boolean flag = false;
        boolean flag1 = false;
        boolean flag2 = false;
        i = s.lastIndexOf('/');
        if(i != -1)
            return s.substring(i + 1, s.length());
        i = s.lastIndexOf('\\');
        if(i != -1)
            return s.substring(i + 1, s.length());
        else
            return s;
    }

    public void setAllowedExtList(String s)
    {
        String s1 = "";
        if(s != null)
        {
            String s2 = "";
            for(int i = 0; i < s.length(); i++)
                if(s.charAt(i) == ',')
                {
                    if(!m_allowedExtList.contains(s2))
                        m_allowedExtList.addElement(s2);
                    s2 = "";
                } else
                {
                    s2 = s2 + s.charAt(i);
                }

            if(s2 != "")
                m_allowedExtList.addElement(s2);
        } else
        {
            m_allowedExtList = null;
        }
    }

    public void setAllowedFileTypeList(String s)
    {
        String s1 = "";
        if(s != null)
        {
            String s2 = "";
            for(int i = 0; i < s.length(); i++)
                if(s.charAt(i) == ',')
                {
                    if(!m_allowedFileTypeList.contains(s2))
                        m_allowedFileTypeList.addElement(s2);
                    s2 = "";
                } else
                {
                    s2 = s2 + s.charAt(i);
                }

            if(s2 != "")
                m_allowedFileTypeList.addElement(s2);
        } else
        {
            m_allowedFileTypeList = null;
        }
    }

    public void setTotalMaxFileSize(long l)
    {
        m_totalMaxFileSize = l;
    }

    public void setMaxFileSize(long l)
    {
        m_maxFileSize = l;
    }

    public Request getRequest()
    {
        return m_formRequest;
    }

    public files getFiles()
    {
        return m_files;
    }

    protected byte m_binArray[];
    protected String realPath;
    protected HttpServletRequest m_request;
    protected HttpServletResponse m_response;
    protected ServletContext m_application;
    private int m_totalBytes;
    private int m_currentIndex;
    private int m_startData;
    private int m_size;
    private int m_endData;
    private String m_boundary;
    private long m_totalMaxFileSize;
    private long m_maxFileSize;
    private Vector m_allowedExtList;
    private Vector m_allowedFileTypeList;
    private Request m_formRequest;
    private int m_count;
    private files m_files;
    protected boolean isCover;
}
