// Decompiled Using: FrontEnd Plus v2.03 and the JAD Engine
// Available From: http://www.reflections.ath.cx
// Decompiler options: packimports(3) 
// Source File Name:   file.java

package upload;

import java.io.File;
import java.io.FileOutputStream;

// Referenced classes of package xiaoxiang.fileUpload:
//            upBean

public class file
{

    protected file(String pFileName, int pStartData, int pSize, int pNumber, String pSubTypeMIME, upBean pParentUpBean)
    {
        fileName = pFileName;
        parentUpBean = pParentUpBean;
        startData = pStartData;
        size = pSize;
        number = pNumber;
        int extFrom = fileName.lastIndexOf('.') + 1;
        fileExtName = fileName.substring(extFrom);
        subTypeMIME = pSubTypeMIME;
    }

    public String getName()
    {
        return fileName;
    }

    public long getSize()
    {
        return (long)size;
    }

    public int getNumber()
    {
        return number;
    }

    public void setName(String name)
    {
        fileName = name;
    }

    public String getExtName()
    {
        return fileExtName;
    }

    public String getSubTypeMIME()
    {
        return subTypeMIME;
    }

    public void saveAs()
        throws Exception
    {
        try
        {
            if(parentUpBean.realPath.equals(""))
                throw new Exception("\u5728\u4F60\u4F7F\u7528file.saveAs()\u65B9\u6CD5\u524D\uFF0C\u8BF7\u5148\u5728upBean\u4E2D\u4F7F\u7528setRealPath()\u3002");
            File fileWrite = new File(parentUpBean.realPath + File.separator + fileName);
            if(!parentUpBean.isCover && fileWrite.exists())
                throw new Exception("\u672C\u7CFB\u7EDF\u4E0D\u5141\u8BB8\u540C\u540D\u8986\u76D6\uFF0C\u4E14\u60A8\u8981\u4E0A\u4F20\u7684\u8FD9\u4E2A\u6587\u4EF6\u5728\u670D\u52A1\u5668\u4E0A\u5DF2\u7ECF\u5B58\u5728\uFF1A" + fileName);
            FileOutputStream fo = new FileOutputStream(fileWrite);
            fo.write(parentUpBean.m_binArray, startData, size);
            fo.close();
        }
        catch(Exception e)
        {
            throw e;
        }
    }

    public void saveAs(String pRealPath)
        throws Exception
    {
        try
        {
            File fileWrite = new File(pRealPath + File.separator + fileName);
            if(!parentUpBean.isCover && fileWrite.exists())
                throw new Exception("\u672C\u7CFB\u7EDF\u4E0D\u5141\u8BB8\u8986\u76D6\u6587\u4EF6\uFF0C\u4E14\u60A8\u8981\u4E0A\u4F20\u7684\u8FD9\u4E2A\u6587\u4EF6\u5728\u670D\u52A1\u5668\u4E0A\u5DF2\u7ECF\u5B58\u5728\uFF1A" + fileName);
            FileOutputStream fo = new FileOutputStream(fileWrite);
            fo.write(parentUpBean.m_binArray, startData, size);
            fo.close();
        }
        catch(Exception e)
        {
            throw e;
        }
    }

    private upBean parentUpBean;
    private String fileExtName;
    private String subTypeMIME;
    protected String fileName;
    protected int size;
    protected int startData;
    protected int number;
}
