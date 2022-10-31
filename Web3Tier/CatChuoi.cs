using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for CatChuoi
/// </summary>
public static class CatChuoi
{
    public static string catChuoi(this string s, int length)
	{
		if (String.IsNullOrEmpty(s))
                throw new ArgumentNullException(s);
            var words = s.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (words[0].Length > length)
                throw new ArgumentException("Từ đầu tiên dài hơn chuỗi cần cắt");
            var sb = new StringBuilder();
            foreach (var word in words)
            {
                if ((sb + word).Length > length)
                    return string.Format("{0}...", sb.ToString().TrimEnd(' '));
                sb.Append(word + " ");
            }
            return string.Format("{0}...", sb.ToString().TrimEnd(' '));
        }
	}