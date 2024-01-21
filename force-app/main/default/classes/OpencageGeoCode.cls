/**
 * @description       : 
 * @author            : Vinay Sriram
 * @group             : 
 * @last modified on  : 07-09-2023
 * @last modified by  : Vinay Sriram
**/
public with sharing class OpencageGeoCode {
    public Results[] results;
	public status status;

    public class Results{
        public Components components;
		public Integer confidence;	//9
		public String formatted;	//Rua Cafelândia, Parque José Alexandre, Carapicuíba - SP, 06321-665, Brazil
		public Geometry geometry;
    }
    Public class Components{
		//public String _category;	//road
		//public String _type;	//road
		public String city;	//Carapicuíba
		//public String city_district;	//Carapicuíba
		public String continent;	//South America
		public String country;	//Brazil
		public String country_code;	//br
		public String county;	//Região Metropolitana de São Paulo
		public String municipality;	//Região Imediata de São Paulo
		public String postcode;	//06321-665
		public String region;	//Southeast Region
		public String road;	//Rua Cafelândia
		public String road_type;	//residential
		public String state;	//São Paulo
		public String state_code;	//SP
		public String state_district;	//Região Geográfica Intermediária de São Paulo
		public String suburb;
    }
    public class Geometry{
        public Double lat;	//-23.5370962
		public Double lng;	//-46.8359735
    }
    public class Status{
        public Integer code;	//200
		public String message;	//OK
    }
    public static OpenCageGeoCode parse(String json){
		return (OpenCageGeoCode) System.JSON.deserialize(json, OpenCageGeoCode.class);
	}
}