namespace DataClassification
{
    public class ImageObject
    {
        public Point FirstPoint { get; set; }
        public Point LastPoint { get; set; }

        public override string ToString()
        {
            return $"{FirstPoint},{LastPoint}";
        }
    }
}