using System;
using System.Collections.Generic;
using System.Text;

namespace DataClassification
{
    public class Image
    {
        public String ImageName { get; set; }
        public List<ImageObject> ImageObjects { get; set; }

        public List<string> ToStrings()
        {
            List<string> listOfStrings = new List<string>();
            foreach (ImageObject imageObject in ImageObjects)
            {
                listOfStrings.Add($"{ImageName},{imageObject.ToString()}");
            }

            return listOfStrings;
        }
    }
}