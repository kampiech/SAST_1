﻿using System.Diagnostics;
using System.Net;
using System.Security.Cryptography;

namespace SAST
{
    public class Class1
    {
        WebClient wc = new WebClient();  
    }
    
    
    public class T1 {}
    public class T2 {}
    public class T3 {}
    public class T4 {}
    public class T5 { public T7 Process(T6 b)}
    public class T6 {}
    public class T7 : T4 {}
    
    public class Foo    // Noncompliant - Foo depends on too many classes: T1, T2, T3, T4, T5, T6 and T7
{
  private T1 a1;    // Foo is coupled to T1
  private T2 a2;    // Foo is coupled to T2
  private T3 a3;    // Foo is coupled to T3

  public T4 Compute(T5 a, T6 b)    // Foo is coupled to T4, T5 and T6
  {
    T7 result = a.Process(b);    // Foo is coupled to T7
    return result;
  }

  public static class Bar    // Compliant - Bar depends on 2 classes: T8 and T9
  {
    public T8 a8;
    public T9 a9;
  }
}
}
