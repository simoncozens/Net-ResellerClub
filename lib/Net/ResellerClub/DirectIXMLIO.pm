#FileName: xmlIO.pm
#AccessLevel: Public
#Lastmodify: 06/08/2004
#UserName: Rushikesh Joshi
# @ 2004, Mega-E-Services 
package Net::ResellerClub::DirectIXMLIO;
use XML::Simple;
#use strict; # like option explicit we must have to define all variable before using it

#This module will generate XML String based on passed data
sub GenerateXML
{
   my ( $thing, $indent ) = @_;
   my ( $type ) = ref $thing;
   my ( $element, $key );
   my ( $maxRecurse, $indentAmount ) = ( 15, 4 );
   my ($lt,$gt) = ("&lt;","&gt;"); # like ("<",">")("&lt;","&gt;");
   my ( $xml_header ) = $lt."?xml version=\"1.0\" encoding=\"UTF-8\"?".$gt;
   my ( $xml_footer ) = ""; #"</xml>";

   my ($vector_schemaspath ) = "http://localhost/Schemas/VectorSchema.xsd";
   my ( $vectorhead ) = $lt."Vector xmlns=\"" . $vector_schemaspath . "\"".$gt;
   my ( $vectorfoot ) = $lt."/Vector".$gt;

   my ( $hash_schemaspath ) = "http://localhost/Schemas/HashtableSchema.xsd";
   my ( $hashhead ) = $lt."Hashtable xmlns=\"" . $hash_schemaspath . "\">";
   my ( $hashfoot ) = $lt."/Hashtable".$gt;
   my (	$retstring ) = "";
if (!($indent)){$retstring = $xml_header."\n"};
   
   # Safety Valve
   die "Looks like infinite recursion!\n" 
      if ( $indent > ( $maxRecurse * $indentAmount ) );

   if ( $type eq undef ) { $retstring= $retstring. "" . $thing; }
   elsif ( $type eq "SCALAR" )
      { $retstring = $retstring. "". $$thing; }
   elsif ( $type eq "ARRAY" )
   {
       $retstring= $retstring. "" . $vectorhead;
	   foreach $element ( @$thing )
          { $retstring= $retstring. $lt."item".$gt.&GenerateXML( $element, $indent + $indentAmount ).$lt."/item".$gt; }
       $retstring= $retstring. "" . $vectorfoot;
   }
   elsif ( $type eq "HASH" )
   {
      $retstring= $retstring. "" . $hashhead;
	  foreach $key ( sort( keys %$thing ) )
      {
	     #$retstring= $retstring. "<item>";	  
         
		 if ( ref $thing->{$key} eq undef )
            { $retstring= $retstring. $lt."row name=\"" . $key ."\"".$gt.$thing->{$key}.$lt."/row".$gt; }
         elsif ( ref $thing->{$key} eq "SCALAR" )
            { $retstring= $retstring. $lt."row name=\"" . $key ."\"".$gt.${$thing->{$key}}.$lt."/row".$gt; }
         else
         {
          $retstring= $retstring. $lt."row name=\"" . $key ."\"".$gt;
          $retstring= $retstring. &GenerateXML( $thing->{$key}, $indent + $indentAmount ).$lt."/row".$gt;  
         }
		 #$retstring= $retstring. "</item>"."\n";
      }
        $retstring= $retstring. "" . $hashfoot;
   }
   if (!($indent)){$retstring = $retstring. "".$xml_footer};
   return $retstring;
}


sub GenerateHTMLTable
{
   my ( $thing, $indent ) = @_;
   my ( $type ) = ref $thing;
   my ( $element, $key );
   my ( $maxRecurse, $indentAmount ) = ( 15, 4 );
   
   my ( $tableHeader ) = "<TABLE border=1 cellSpacing=1 cellPadding=1 width=100%>";
   my ( $tableFooter ) = "</TABLE>";

   my ( $tdHead ) = "<TD>";
   my ( $tdFoot ) = "</TD>";
#   my ( $trHead ) = "<TR style='COLOR: red'>";# rgb(" .($maRexcurse + $indentAmount) ."," . ($maRexcurse + $indentAmount) . "," .($maRexcurse + $indentAmount).")'>";
   my ( $trHead ) = "<TR width=50%>";
   my ( $trFoot ) = "</TR>";
   my (	$retstring ) = "";

   $retstring = $tableHeader."\n";

   # Safety Valve
   die "Looks like infinite recursion!\n" 
      if ( $indent > ( $maxRecurse * $indentAmount ) );

   if ( $type eq undef ) { $retstring .= $thing; }
   elsif ( $type eq "SCALAR" )
      { $retstring .= $$thing; }
   elsif ( $type eq "ARRAY" )
   {
       $retstring .= $trHead."\n";
	   foreach $element ( @$thing )
		   { 
				$retstring .= $tdHead.&GenerateHTMLTable( $element, $indent + $indentAmount ).$tdFoot."\n";
	       }
       $retstring .= $trFoot."\n";
   }
   elsif ( $type eq "HASH" )
   {
	  foreach $key ( sort( keys %$thing ) )
      {
	     $retstring .= $trHead."\n";
		 if ( ref $thing->{$key} eq undef )
            { 
				$retstring .= $tdHead.$key.$tdFoot.$tdHead.$thing->{$key}.$tdFoot."\n";
			}
         elsif ( ref $thing->{$key} eq "SCALAR" )
            { 
				$retstring .= $tdHead.$key.$tdFoot.$tdHead.${$thing->{$key}}.$tdFoot."\n";
			}
         else
         {
	            $retstring .= $tdHead.$key.$tdFoot."\n";
	            $retstring .= $tdHead. &GenerateHTMLTable( $thing->{$key}, $indent + $indentAmount ).$tdFoot."\n";  
         }
      $retstring .= $trFoot."\n";
	  }
   }
   $retstring .= $tableFooter;
   return $retstring;
}

sub ParseXML
{
	(my $xmlstring) = @_;
	my  $type  = ref $xmlstring;
	# Parsing using XML::Simple
	my $xs = new XML::Simple();#KeepRoot => 1);# ,forcearray => 1);#forcearray => 1,keyattr=>[name,row]
	#  $xmlstring = "<opt><item name=\"one\">First</item><item name=\"two\">Second</item></opt>";
	if ( $type eq "ARRAY" )
	{
		my $ReturnVal = GetAnything($xmlstring);
	}
	else
	{
		my $parser_str=$xs->XMLin($xmlstring,
			  forcearray => 1,
  	 		  KeepRoot => 0,
              contentkey => 'value', #'-content',
			  GroupTags => {Hashtable => 'row'}
			  );
		my $ReturnVal = GetAnything($parser_str);
	}
}



sub GetAnything
{
	
   my ( $thing, $indent ) = @_;
   my ( $type ) = ref $thing;
   my ( $element, $key );
   my ( $maxRecurse, $indentAmount ) = ( 15, 4 );

   my $retstring;
   my %myHashValue;
   my @myVectorValue;
   my $arrCount=0;
#if (!($indent)){$retstring = $xml_header."\n"};
   
   # Safety Valve
   die "Looks like infinite recursion!\n" 
      if ( $indent > ( $maxRecurse * $indentAmount ) );
   if ( $type eq undef ) { $retstring=$thing;
	   #print " " x $indent . $thing . "\n";
	   }
   elsif ( $type eq "SCALAR" )
      { $retstring = $$thing;
	   #print  " " x $indent . $$thing . "\n";
	  }
   elsif ( $type eq "ARRAY" )
   {
	   $arrCount=0;
	   my $arrSize = @$thing;
	   #print "Array Size $arrSize";
	   foreach $element ( @$thing )
          {
 		   if ($arrSize == 1){
			   #print "Type :", ref($vecValue)," value ",$element, " type of value" ,  ref($element),"\n";
		   	   $vecValue = &GetAnything( $element, $indent + $indentAmount );
			   if ((ref($vecValue) eq "ARRAY" )) # || (ref($vecValue) eq undef )){
			      { 		   	  
        		   $myVectorValue[$arrCount]=$vecValue;
        		   $retstring= \@myVectorValue;
        		   $arrCount++;
				  }
			   else{
       		   	  $retstring=$vecValue;
				  #print "Mine $vecValue .","\n";
			   }  
		   }
		   else{ 
    		   $myVectorValue[$arrCount]=&GetAnything( $element, $indent + $indentAmount );
    		   $retstring= \@myVectorValue;
    		   $arrCount++;
			   }
		   }
   }
   elsif ( $type eq "HASH" )
   {
	  foreach $key ( sort( keys %$thing ) )
      {
		 if ( ref $thing->{$key} eq undef )
            {
			 #print " " x $indent . "$key -> $thing->{$key}\n";
			 if(CheckValidKey($key)==0){
			 			 $myHashValue{$key}=$thing->{$key};
			 			 }
			 if(CheckSkipKey($key)==1){
			 			 $retstring=$thing->{$key}; 
			 }
			 }
         elsif ( ref $thing->{$key} eq "SCALAR" )
            { 
			#print " " x $indent . "$key -> ${$thing->{$key}}\n";
			 if(CheckValidKey($key)==0){
			 			 $myHashValue{$key}=${$thing->{$key}};
						 }
			 if(CheckSkipKey($key)==1){
			 			 $retstring=${$thing->{$key}}; 
			 }
			}
         else
         {
		   #print " " x $indent . "$key: \n";
           if(CheckSkipKey($key)==1){
           		  $retstring=&GetAnything( $thing->{$key}, $indent + $indentAmount ); 
           }
		   else{
		   		  $myHashValue{$key} = &GetAnything( $thing->{$key}, $indent + $indentAmount );
			   } 
         }

		 if ($retstring eq ""){			 
		 $retstring=\%myHashValue;
		 }

      }
   }
#   if (!($indent)){$retstring = $retstring};
   return $retstring;
}

sub CheckValidKey
{
   my ( $KeyName ) = @_;
   @InValidKeys =("xmlns","xmlns:xsi","xmlns:xsd","xmlns:soapenv","xmlns:ns1","soapenv:encodingStyle");
  
	   foreach $element ( @InValidKeys )
          {
		  #print $element," -- ",$KeyName,"\n";
		   if (lc($element) eq lc($KeyName)){
		   return 1;
		   }
		  }
	return 0;
}

sub CheckSkipKey
{
   my ( $KeyName ) = @_;
   @SkipKeys =("value","row","item","Hashtable","Vector","soapenv:Body","xsd:string"); #"ns1:getDetailsResponse",

#   "xmlns:xsi","xmlns:xsd","xmlns:soapenv","soapenv:Body","ns1:getDetailsResponse","xmlns:ns1","soapenv:encodingStyle","xsd:string"
   
	   foreach $element ( @SkipKeys )
          {
		  #print $element," -- ",$KeyName,"\n";
#  		   if (lc($element) eq lc("value")){print "Hello ". $element," -- ",$KeyName,"\n"; }
		   if (lc($element) eq lc($KeyName)){
		   return 1;
		   }
		  }
	return 0;
}


sub GenerateXML1
{
   my ( $thing, $indent ) = @_;
   my ( $type ) = ref $thing;
   my ( $element, $key );
   my ( $maxRecurse, $indentAmount ) = ( 15, 4 );
   my ( $xml_header ) = "";#<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
   my ( $xml_footer ) = ""; #"</xml>";

   my ($vector_schemaspath ) = "http://localhost/Schemas/VectorSchema.xsd";
   my ( $vectorhead ) = "<Vector xmlns=\"" . $vector_schemaspath . "\">";
   my ( $vectorfoot ) = "</Vector>";

   my ( $hash_schemaspath ) = "http://localhost/Schemas/HashtableSchema.xsd";
   my ( $hashhead ) = "<Hashtable xmlns=\"" . $hash_schemaspath . "\">";
   my ( $hashfoot ) = "</Hashtable>";
   my (	$retstring ) = "";
if (!($indent)){$retstring = $xml_header."\n"};
   
   # Safety Valve
   die "Looks like infinite recursion!\n" 
      if ( $indent > ( $maxRecurse * $indentAmount ) );

   if ( $type eq undef ) { $retstring= $retstring. "" . $thing; }
   elsif ( $type eq "SCALAR" )
      { $retstring = $retstring. "". $$thing; }
   elsif ( $type eq "ARRAY" )
   {
       $retstring= $retstring. "" . $vectorhead;
	   foreach $element ( @$thing )
          { $retstring= $retstring. "<item>".&GenerateXML( $element, $indent + $indentAmount )."</item>"; }
       $retstring= $retstring. "" . $vectorfoot;
   }
   elsif ( $type eq "HASH" )
   {
      $retstring= $retstring. "" . $hashhead;
	  foreach $key ( sort( keys %$thing ) )
      {
	     #$retstring= $retstring. "<item>";	  
         
		 if ( ref $thing->{$key} eq undef )
            { $retstring= $retstring. "<row name=\"" . $key ."\">".$thing->{$key}."</row>"; }
         elsif ( ref $thing->{$key} eq "SCALAR" )
            { $retstring= $retstring. "<row name=\"" . $key ."\">".${$thing->{$key}}."</row>"; }
         else
         {
          $retstring= $retstring. "<row name=\"" . $key ."\">";
          $retstring= $retstring. &GenerateXML( $thing->{$key}, $indent + $indentAmount )."</row>";  
         }
		 #$retstring= $retstring. "</item>"."\n";
      }
        $retstring= $retstring. "" . $hashfoot;
   }
   if (!($indent)){$retstring = $retstring. "".$xml_footer};
   return $retstring;
}


1;
