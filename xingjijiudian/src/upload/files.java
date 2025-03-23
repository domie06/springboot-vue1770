// Decompiled Using: FrontEnd Plus v2.03 and the JAD Engine
// Available From: http://www.reflections.ath.cx
// Decompiler options: packimports(3) 
// Source File Name:   files.java

package upload;

import java.util.Hashtable;

// Referenced classes of package xiaoxiang.fileUpload:
//            file

public class files
{

    protected files()
    {
        hFiles = new Hashtable();
        count = 0;
        totalSize = 0L;
    }

    protected void addFile(file pFile)
    {
        hFiles.put(new Integer(count), pFile);
        count++;
        totalSize += pFile.getSize();
    }

    public file getFile(int pCount)
        throws Exception
    {
        if(pCount >= count || pCount <= -1)
        {
            throw new Exception("\u53C2\u6570\u9519\u8BEF");
        } else
        {
            file tempFile = (file)hFiles.get(new Integer(pCount));
            return tempFile;
        }
    }

    public int getCount()
    {
        return count;
    }

    public long getSize()
    {
        return totalSize;
    }

    private Hashtable hFiles;
    private long totalSize;
    private int count;
}
