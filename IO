using System;
using System.ComponentModel.DataAnnotations;
using System.IO;

public class a : FileStream
{
    public int t { get; set; }
    public a(int a, string str, FileMode mode):base(str,mode)
    {
        t = a;
    }
    public override void Write(byte[] array, int offset, int count)
    {
        base.Write(array, offset, count);
        Console.WriteLine("Здарова, ты в файлстрим");
    }
}

public class c : StreamWriter
{
    public c(Stream str) : base(str)
    {
    }

    public override void Write(string? value)
    {
        base.Write(value);
        Console.WriteLine("Здарова, ты в стримврайтере");
    }
}

class KtoD
{
    static void Main()
    {
        string str;
        a a;
        // Открыть сначала поток файлового ввода-вывода.
        try
        {
            a = new a(20,"test.txt", FileMode.Create);
        }
        
            catch (IOException exc)
        {
            Console.WriteLine("Ошибка открытия файла:\n" + exc.Message);
            return;
        }
        // Заключить поток файлового ввода-вывода в оболочку класса StreamWriter.
        c fstr_out = new c(a);
        try
        {
            Console.WriteLine("Введите текст, а по окончании — 'стоп'.");
            do
            {
                Console.Write(": ");
                str = Console.ReadLine();
                if (str != "стоп")
                {
                    str = str + "\r\n"; // добавить новую строку
                    fstr_out.Write(str);
                }
            } while (str != "стоп");
        }
        catch (IOException exc)
        {
            Console.WriteLine("Ошибка ввода-вывода:\n" + exc.Message);
        }
        finally
        {
            fstr_out.Close();
        }
    }
}
