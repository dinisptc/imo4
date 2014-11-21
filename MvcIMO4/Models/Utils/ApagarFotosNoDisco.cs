﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace MvcIMO4.Models
{
    public class ApagarFotosNoDisco
    {

        public void DeleteFile(string filename)
        {
            if (filename != null)
            {
                if (File.Exists(filename))
                    File.Delete(filename);
            }
        }
    }
}