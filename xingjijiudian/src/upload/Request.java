// Decompiled Using: FrontEnd Plus v2.03 and the JAD Engine
// Available From: http://www.reflections.ath.cx
// Decompiler options: packimports(3) 
// Source File Name:   Request.java

package upload;

import java.util.Enumeration;
import java.util.Hashtable;

public class Request
{

    Request()
    {
        m_parameters = new Hashtable();
        m_counter = 0;
    }

    protected void putParameter(String name, String value)
    {
        if(name == null)
            throw new IllegalArgumentException("The name of an element cannot be null.");
        if(m_parameters.containsKey(name))
        {
            Hashtable hashtable = (Hashtable)m_parameters.get(name);
            hashtable.put(new Integer(hashtable.size()), value);
        } else
        {
            Hashtable hashtable1 = new Hashtable();
            hashtable1.put(new Integer(0), value);
            m_parameters.put(name, hashtable1);
            m_counter++;
        }
    }

    public String getParameter(String s)
    {
        if(s == null)
            throw new IllegalArgumentException("Form's name is invalid or does not exist (1305).");
        Hashtable hashtable = (Hashtable)m_parameters.get(s);
        if(hashtable == null)
            return null;
        else
            return (String)hashtable.get(new Integer(0));
    }

    public Enumeration getParameterNames()
    {
        return m_parameters.keys();
    }

    public String[] getParameterValues(String s)
    {
        if(s == null)
            throw new IllegalArgumentException("Form's name is invalid or does not exist (1305).");
        Hashtable hashtable = (Hashtable)m_parameters.get(s);
        if(hashtable == null)
            return null;
        String as[] = new String[hashtable.size()];
        for(int i = 0; i < hashtable.size(); i++)
            as[i] = (String)hashtable.get(new Integer(i));

        return as;
    }

    private Hashtable m_parameters;
    private int m_counter;
}
