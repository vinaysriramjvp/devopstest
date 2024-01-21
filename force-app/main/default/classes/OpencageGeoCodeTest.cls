/**
 * @description       : 
 * @author            : Vinay Sriram
 * @group             : 
 * @last modified on  : 07-09-2023
 * @last modified by  : Vinay Sriram
**/
@istest
public with sharing class OpencageGeoCodeTest {
    
    static testMethod void testParse() {
		String json=		'{'+
		'  "results": ['+
		'    {'+
		'      "components": {'+
		'        "ISO_3166-1_alpha-2": "BR",'+
		'        "ISO_3166-1_alpha-3": "BRA",'+
		'        "ISO_3166-2": ['+
		'          "BR-SP"'+
		'        ],'+
		'        "_category": "road",'+
		'        "_type": "road",'+
		'        "city": "Carapicuíba",'+
		'        "city_district": "Carapicuíba",'+
		'        "continent": "South America",'+
		'        "country": "Brazil",'+
		'        "country_code": "br",'+
		'        "county": "Região Metropolitana de São Paulo",'+
		'        "municipality": "Região Imediata de São Paulo",'+
		'        "postcode": "06321-665",'+
		'        "region": "Southeast Region",'+
		'        "road": "Rua Cafelândia",'+
		'        "road_type": "residential",'+
		'        "state": "São Paulo",'+
		'        "state_code": "SP",'+
		'        "state_district": "Região Geográfica Intermediária de São Paulo",'+
		'        "suburb": "Parque José Alexandre"'+
		'      },'+
		'      "confidence": 9,'+
		'      "formatted": "Rua Cafelândia, Parque José Alexandre, Carapicuíba - SP, 06321-665, Brazil",'+
		'      "geometry": {'+
		'        "lat": -23.5370962,'+
		'        "lng": -46.8359735'+
		'      }'+
		'    }'+
		'  ],'+
		'  "status": {'+
		'    "code": 200,'+
		'    "message": "OK"'+
		'  }'+
		'}';
		OpenCageGeoCode obj = OpenCageGeoCode.parse(json);
		System.assert(obj != null);
	}

}