require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test 'comments can have comment text' do
    c = Comment.new
    c.comment_text = "yr blog posts is booooring. :P"
    assert_equal "yr blog posts is booooring. :P", c.comment_text
  end

  test 'comment text must be between 1 and 3000 characters' do
    c = Comment.new
    ["The Norse gods, especially, Odin, were viewed as fickle.  Whether you worshiped them or not, they might favor or abandon you.  Of course the hope was that by worshiping them and making deals one god or another, you might retain their favor longer or have it at certain key points such as a particular battle, a raiding expedition, or a harvesting season.  The overarching sentiment behind the religion was not worship these gods properly or be smitten, but, life's unpredictable and subject to things outside of our control like luck and the will of the gods, so let's try to tip the scales in our favor however we can including religious observance. The Christian god, according to his missionaries, had power not only to reward or punish after death, but also to take care of his followers during their lifetime.  Though Christians tend to explain it with God works in mysterious ways, the Christian god was also fickle - life goes well or not regardless of belief system.  Just like you could dedicate your enemies to Odin to try and win his favor, you could try to win the Christian god's favor by converting, building churches, and living according to Christian doctrine.  Missionaries first came to Scandinavia in the 9th century, and by middle of the century they were tolerated well enough in Denmark and Sweden that churches were allowed to be built at the trading centers of Ribe, Hedeby and Birka.  The first missionaries had few conversions.  Individuals were accustomed to choosing what gods they worshiped and how fervently.  For several centuries, worship of the Christian god coexisted with pagan beliefs.  If an individual felt that Christ might bestow favors, he might worship Christ alongside Thor.  Overall, missionaries did not have much success until the second half of the tenth century.  The spread of Christianity though Scandinavia at the end of the Viking Age had less to do with fear of or even belief in a certain god and more to do with politics and power.  Unlike Christianity, missionary work and conversion were not central the pagan belief system of Scandinavia.  If a powerful chieftain in your district worshiped Thor especially, and you were particular to Freyr or were a Christian, or didn't believe in any gods, this was likely to be fine as long as it did not interfere with the chieftain's ability to exercise his power and other such practical matters.  On the other hand, if the powerful chieftain has been converted to Christianity, he gets points with his new god for each and every convert.  He's likely to lean heavily on the members of his household and and lesser chieftains in the area over whom he has influence.  The above paragraphs draw on H.R. Ellis Davidson’s Gods and Myths of Northern Europe.  The following broad outline of the spread of Christianity in Scandinavia comes from Gwyn Jone’s A History of the Vikings, Birgit and Peter Sawyer’s Medieval Scandinavia From Conversion to Reformation circa 800-1500, and the wikipedia articles on Cnut the Great, Olav Tryggvason, Harald Bluetooth, and Håkon I of Norway.", ""].each do |comment_text|
      c.comment_text = comment_text
      assert !c.valid?
    end
  end

  test 'comments can have creator alias' do
    c = Comment.new
    c.creator_alias = 'skuld'
    assert_equal 'skuld', c.creator_alias
  end

  test 'comments must have creator alias' do
    c = Comment.new
    c.creator_alias = ""
    assert !c.valid?
  end

  test 'comments can have creator email' do
    c = Comment.new
    c.creator_email = "skuld@gmail.com"
    assert_equal "skuld@gmail.com", c.creator_email
  end

  test 'comments must have creator email' do
    c = Comment.new
    c.creator_email = ""
    assert !c.valid?
  end

  test 'creator email must be formatted like an email address' do
    c = Comment.new
    ["missingDomain@.com",
     "@missingLocal.org",
     "missingatSign.net",
     "missingDot@com",
     "two@@signs.com",
     "colonButNoPort@127.0.0.1:",
     "someone-else@127.0.0.1.26",
     ".localStartsWithDot@domain.com",
     "localEndsWithDot.@domain.com",
     "two..consecutiveDots@domain.com",
     "domainStartsWithDash@-domain.com",
     "domainEndsWithDash@domain-.com",
     "numbersInTLD@domain.c0m",
     "missingTLD@domain.",
     '! "#$%(),/;<>[]`|@invalidCharsInLocal.org',
     'invalidCharsInDomain@! "#$%(),/;<>_[]`|.org',
     "local@SecondLevelDomainNamesAreInvalidIfTheyAreLongerThan64Charactersss.org"
    ].each do |email|
      c.creator_email = email
      assert !c.valid?
    end
  end

  test 'comments can be associated with a post' do
    c = valid_comment
    assert_equal Post.last, c.post 
  end

  test 'comments must be associated with a post' do
    c = valid_comment
    c.post = nil
    assert !c.valid?
  end


end
