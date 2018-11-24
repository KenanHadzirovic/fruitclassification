using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.Xml.Xsl;
using FileStyleUriParser = System.FileStyleUriParser;

namespace DataClassification
{
    class Program
    {
        public static XslCompiledTransform SchemaTransform { get; set; }
        public static string DirectoryPath { get; set; }
        public static List<string> Files { get; set; }
        public static List<string> Entries { get; set; }

        static void Main(string[] args)
        {
            SchemaTransform = new XslCompiledTransform();
            SchemaTransform.Load("SchemaMap.xslt");
            Entries = new List<string>();
            Console.WriteLine("Please enter directory path: ");
            DirectoryPath = Console.ReadLine();
            Directory.SetCurrentDirectory(DirectoryPath);
            Files = Directory.GetFiles(DirectoryPath).ToList();
            MapFiles(Files);
            Console.WriteLine("File mapping completed successfully.");
            File.WriteAllLines($"{Directory.GetParent(DirectoryPath)}/imageInformation.csv", Entries);
            Console.WriteLine($"{Entries.Count} lines written about {Files.Count} images.");
            Console.ReadLine();
        }

        public static void MapFiles(List<string> files)
        {
            Entries.Add("Filename,Xmin,Ymin,Xmax,Ymax");
            foreach(string file in files)
            {
                Entries.AddRange(MapFileToObject(file).ToStrings());
            }
        }

        public static Image MapFileToObject(string filePath)
        {
            string xmlData = String.Empty;
            using (StringWriter sw = new StringWriter())
            {
                SchemaTransform.Transform(filePath, null, sw);
                xmlData = sw.ToString();
            }
            return FromXml<Image>(xmlData);
        }

        private static Image FromXml<Image>(String xml)
        {
            Image image = default(Image);

            using (TextReader reader = new StringReader(xml))
            {
                image = (Image)new XmlSerializer(typeof(Image)).Deserialize(reader);
            }

            return image;
        }
    }
}
