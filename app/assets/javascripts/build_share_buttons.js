var build_share_buttons = function(){
    twitter_url = "https://twitter.com/intent/tweet?url=" + escape(document.URL) + 
                  "&text=" + escape($("#social_share_text").text()) + "&via=gr33ndata";
    facebook_url = "https://www.facebook.com/sharer/sharer.php?u=" + document.URL 
    $("#twitter_share").attr( "href", twitter_url);
    $("#facebook_share").attr( "href", facebook_url);
} 