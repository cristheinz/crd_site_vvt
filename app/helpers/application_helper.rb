module ApplicationHelper
  
  def full_title(page_title)
    base_title = "Vou Viajar Turismo"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def currencies
    # values from http://www.webservicex.net/ws/WSDetails.aspx?CATID=2&WSID=10
    map=[
      ['AFA-Afghanistan Afghani','AFA'],['ALL-Albanian Lek','ALL'],['DZD-Algerian Dinar','DZD'],['ARS-Argentine Peso','ARS'],['AWG-Aruba Florin','AWG'],['AUD-Australian Dollar','AUD'],
      ['BSD-Bahamian Dollar','BSD'],['BHD-Bahraini Dinar','BHD'],['BDT-Bangladesh Taka','BDT'],['BBD-Barbados Dollar','BBD'],['BZD-Belize Dollar','BZD'],['BMD-Bermuda Dollar','BMD'],
      ['BTN-Bhutan Ngultrum','BTN'],['BOB-Bolivian Boliviano','BOB'],['BWP-Botswana Pula','BWP'],['BRL-Brazilian Real','BRL'],['GBP-British Pound','GBP'],['BND-Brunei Dollar','BND'],
      ['BIF-Burundi Franc','BIF'],['XOF-CFA Franc (BCEAO)','XOF'],['XAF-CFA Franc (BEAC)','XAF'],['KHR-Cambodia Riel','KHR'],['CAD-Canadian Dollar','CAD'],['CVE-Cape Verde Escudo','CVE'],
      ['KYD-Cayman Islands Dollar','KYD'],['CLP-Chilean Peso','CLP'],['CNY-Chinese Yuan','CNY'],['COP-Colombian Peso','COP'],['KMF-Comoros Franc','KMF'],['CRC-Costa Rica Colon','CRC'],
      ['HRK-Croatian Kuna','HRK'],['CUP-Cuban Peso','CUP'],['CYP-Cyprus Pound','CYP'],['CZK-Czech Koruna','CZK'],['DKK-Danish Krone','DKK'],['DJF-Dijibouti Franc','DJF'],
      ['DOP-Dominican Peso','DOP'],['XCD-East Caribbean Dollar','XCD'],['EGP-Egyptian Pound','EGP'],['SVC-El Salvador Colon','SVC'],['EEK-Estonian Kroon','EEK'],['ETB-Ethiopian Birr','ETB'],
      ['EUR-Euro','EUR'],['FKP-Falkland Islands Pound','FKP'],['GMD-Gambian Dalasi','GMD'],['GHC-Ghanian Cedi','GHC'],['GIP-Gibraltar Pound','GIP'],['XAU-Gold Ounces','XAU'],
      ['GTQ-Guatemala Quetzal','GTQ'],['GNF-Guinea Franc','GNF'],['GYD-Guyana Dollar','GYD'],['HTG-Haiti Gourde','HTG'],['HNL-Honduras Lempira','HNL'],['HKD-Hong Kong Dollar','HKD'],
      ['HUF-Hungarian Forint','HUF'],['ISK-Iceland Krona','ISK'],['INR-Indian Rupee','INR'],['IDR-Indonesian Rupiah','IDR'],['IQD-Iraqi Dinar','IQD'],['ILS-Israeli Shekel','ILS'],
      ['JMD-Jamaican Dollar','JMD'],['JPY-Japanese Yen','JPY'],['JOD-Jordanian Dinar','JOD'],['KZT-Kazakhstan Tenge','KZT'],['KES-Kenyan Shilling','KES'],['KRW-Korean Won','KRW'],
      ['KWD-Kuwaiti Dinar','KWD'],['LAK-Lao Kip','LAK'],['LVL-Latvian Lat','LVL'],['LBP-Lebanese Pound','LBP'],['LSL-Lesotho Loti','LSL'],['LRD-Liberian Dollar','LRD'],['LYD-Libyan Dinar','LYD'],
      ['LTL-Lithuanian Lita','LTL'],['MOP-Macau Pataca','MOP'],['MKD-Macedonian Denar','MKD'],['MGF-Malagasy Franc','MGF'],['MWK-Malawi Kwacha','MWK'],['MYR-Malaysian Ringgit','MYR'],
      ['MVR-Maldives Rufiyaa','MVR'],['MTL-Maltese Lira','MTL'],['MRO-Mauritania Ougulya','MRO'],['MUR-Mauritius Rupee','MUR'],['MXN-Mexican Peso','MXN'],['MDL-Moldovan Leu','MDL'],
      ['MNT-Mongolian Tugrik','MNT'],['MAD-Moroccan Dirham','MAD'],['MZM-Mozambique Metical','MZM'],['MMK-Myanmar Kyat','MMK'],['NAD-Namibian Dollar','NAD'],['NPR-Nepalese Rupee','NPR'],
      ['ANG-Neth Antilles Guilder','ANG'],['NZD-New Zealand Dollar','NZD'],['NIO-Nicaragua Cordoba','NIO'],['NGN-Nigerian Naira','NGN'],['KPW-North Korean Won','KPW'],['NOK-Norwegian Krone','NOK'],
      ['OMR-Omani Rial','OMR'],['XPF-Pacific Franc','XPF'],['PKR-Pakistani Rupee','PKR'],['XPD-Palladium Ounces','XPD'],['PAB-Panama Balboa','PAB'],['PGK-Papua New Guinea Kina','PGK'],
      ['PYG-Paraguayan Guarani','PYG'],['PEN-Peruvian Nuevo Sol','PEN'],['PHP-Philippine Peso','PHP'],['XPT-Platinum Ounces','XPT'],['PLN-Polish Zloty','PLN'],['QAR-Qatar Rial','QAR'],
      ['ROL-Romanian Leu','ROL'],['RUB-Russian Rouble','RUB'],['WST-Samoa Tala','WST'],['STD-Sao Tome Dobra','STD'],['SAR-Saudi Arabian Riyal','SAR'],['SCR-Seychelles Rupee','SCR'],
      ['SLL-Sierra Leone Leone','SLL'],['XAG-Silver Ounces','XAG'],['SGD-Singapore Dollar','SGD'],['SKK-Slovak Koruna','SKK'],['SIT-Slovenian Tolar','SIT'],['SBD-Solomon Islands Dollar','SBD'],
      ['SOS-Somali Shilling','SOS'],['ZAR-South African Rand','ZAR'],['LKR-Sri Lanka Rupee','LKR'],['SHP-St Helena Pound','SHP'],['SDD-Sudanese Dinar','SDD'],['SRG-Surinam Guilder','SRG'],
      ['SZL-Swaziland Lilageni','SZL'],['SEK-Swedish Krona','SEK'],['TRY-Turkey Lira','TRY'],['CHF-Swiss Franc','CHF'],['SYP-Syrian Pound','SYP'],['TWD-Taiwan Dollar','TWD'],
      ['TZS-Tanzanian Shilling','TZS'],['THB-Thai Baht','THB'],['TOP-Tonga Paanga','TOP'],['TTD-Trinidad&Tobago Dollar','TTD'],['TND-Tunisian Dinar','TND'],['TRL-Turkish Lira','TRL'],
      ['USD-U.S. Dollar','USD'],['AED-UAE Dirham','AED'],['UGX-Ugandan Shilling','UGX'],['UAH-Ukraine Hryvnia','UAH'],['UYU-Uruguayan New Peso','UYU'],['VUV-Vanuatu Vatu','VUV'],
      ['VEB-Venezuelan Bolivar','VEB'],['VND-Vietnam Dong','VND'],['YER-Yemen Riyal','YER'],['YUM-Yugoslav Dinar','YUM'],['ZMK-Zambian Kwacha','ZMK'],['ZWD-Zimbabwe Dollar','ZWD']
    ]
    map=[
      ['ARS-Argentine Peso','ARS'],
      ['AUD-Australian Dollar','AUD'],
      ['BRL-Brazilian Real','BRL'],
      ['GBP-British Pound','GBP'],
      ['CAD-Canadian Dollar','CAD'],
      ['CNY-Chinese Yuan','CNY'],
      ['EUR-Euro','EUR'],
      ['JPY-Japanese Yen','JPY'],
      ['CHF-Swiss Franc','CHF'],
      ['USD-U.S. Dollar','USD']
    ]
  end
  
  def category_map
    cmap=[
        [t(:not_publish), 0],
        [t(:national),1],
        [t(:international),2],
        [t(:events), 3],
        [t(:others),4]
      ]
    return cmap
  end
  
  def get_category(id)
    category_map.each do |description, key|
      if key == id
        return description
      end
    end
  end
  
  def row_status(pack)
    if pack.category_id==0
      'error'
    else
      if pack.image.to_s.empty? || pack.pdf.to_s.empty?
        'warning'
      else
        'success'
      end
    end
  end
  
  def profile
    Profile.first
  end
  
  def default_rss
    'http://vidaeestilo.terra.com.br/rss/Controller?channelid=ddd26e40c5234310VgnVCM20000099f154d0RCRD&ctName=atomo-noticia&lg=pt-br'
  end
  
end
