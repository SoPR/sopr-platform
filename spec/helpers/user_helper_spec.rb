require 'spec_helper'

describe UsersHelper do
  let(:user) { double('User') }

  before :each do
    user.stub(:gravatar_user_hash).and_return('b6694c75d95b8c1571f0ea8d732e6866')
    user.stub(:facebook_username).and_return('jose.a.padilla')
    user.stub(:twitter_username).and_return('JonahBinario')
    user.stub(:linkedin_username).and_return('joseapadilla')
    user.stub(:github_username).and_return('jonahoffline')
    user.stub(:flickr_username).and_return('99104748@N07')
    user.stub(:dribbble_username).and_return('toxinide')
    user.stub(:website_url).and_return('http://www.pixelhipsters.com')
    user.stub(:facebook_username?).and_return(true)
    user.stub(:twitter_username?).and_return(true)
    user.stub(:linkedin_username?).and_return(true)
    user.stub(:github_username?).and_return(true)
    user.stub(:flickr_username?).and_return(true)
    user.stub(:dribbble_username?).and_return(true)
    user.stub(:website_url?).and_return(true)
  end

  describe '#gravatar_for' do
    it 'returns gravatar url with default size' do
      expect(helper.gravatar_for(user))
        .to eq('http://gravatar.com/avatar/b6694c75d95b8c1571f0ea8d732e6866.png?s=140')
    end

    it 'returns gravatar url with custom size' do
      expect(helper.gravatar_for(user, { size: 300 }))
        .to eq('http://gravatar.com/avatar/b6694c75d95b8c1571f0ea8d732e6866.png?s=300')
    end
  end

  describe '#facebook_url' do
    it 'returns facebook url for username' do
      expect(helper.facebook_url(user))
      .to eq('https://facebook.com/jose.a.padilla')
    end
  end

  describe '#twitter_url' do
    it 'returns twitter url for username' do
      expect(helper.twitter_url(user))
      .to eq('https://twitter.com/JonahBinario')
    end
  end

  describe '#linkedin_url' do
    it 'returns linkedin url for username' do
      expect(helper.linkedin_url(user))
      .to eq('http://www.linkedin.com/in/joseapadilla')
    end
  end

  describe '#github_url' do
    it 'returns github url for username' do
      expect(helper.github_url(user))
      .to eq('https://github.com/jonahoffline')
    end
  end
  describe '#flickr_url' do
    it 'returns flickr url for username' do
      expect(helper.flickr_url(user))
      .to eq('http://www.flickr.com/people/99104748@N07/')
    end
  end

  describe '#dribbble_url' do
    it 'returns dribbble url for username' do
      expect(helper.dribbble_url(user))
      .to eq('http://dribbble.com/toxinide')
    end
  end

  describe '#facebook_icon_link' do
    it 'returns facebook icon in an <em> tag nested inside an anchor link' do
      expect(helper.facebook_icon_link(user))
      .to eq("<a href=\"https://facebook.com/jose.a.padilla\"><em class=\"icon-facebook-1\"></em></a>")
    end
  end

  describe '#twitter_icon_link' do
    it 'returns twitter icon in an <em> tag nested inside an anchor link' do
      expect(helper.twitter_icon_link(user))
      .to eq("<a href=\"https://twitter.com/JonahBinario\"><em class=\"icon-twitter-1\"></em></a>")
    end
  end

  describe '#linkedin_icon_link' do
    it 'returns linkedin icon in an <em> tag nested inside an anchor link' do
      expect(helper.linkedin_icon_link(user))
      .to eq("<a href=\"http://www.linkedin.com/in/joseapadilla\"><em class=\"icon-linkedin-2\"></em></a>")
    end
  end

  describe '#github_icon_link' do
    it 'returns github icon in an <em> tag nested inside an anchor link' do
      expect(helper.github_icon_link(user))
      .to eq("<a href=\"https://github.com/jonahoffline\"><em class=\"icon-github\"></em></a>")
    end
  end

  describe '#flickr_icon_link' do
    it 'returns flickr icon in an <em> tag nested inside an anchor link' do
      expect(helper.flickr_icon_link(user))
      .to eq("<a href=\"http://www.flickr.com/people/99104748@N07/\"><em class=\"icon-flickr\"></em></a>")
    end
  end
  describe '#dribbble_icon_link' do
    it 'returns dribbble icon in an <em> tag nested inside an anchor link' do
      expect(helper.dribbble_icon_link(user))
      .to eq("<a href=\"http://dribbble.com/toxinide\"><em class=\"icon-dribbble-1\"></em></a>")
    end
  end

  describe '#website_icon_link' do
    it 'returns website icon in an <em> tag nested inside an anchor link' do
      expect(helper.website_icon_link(user))
      .to eq("<a href=\"http://www.pixelhipsters.com\"><em class=\"icon-globe-2\"></em></a>")
    end
  end

  describe '#social_icon_links' do
    context 'when all social profiles are available' do
      it 'returns unsorted list with social icons for all accounts' do
        expect(helper.social_icon_links(user))
        .to eq("<ul><li><a href=\"https://facebook.com/jose.a.padilla\"><em class=\"icon-facebook-1\"></em></a></li><li><a href=\"https://twitter.com/JonahBinario\"><em class=\"icon-twitter-1\"></em></a></li><li><a href=\"http://www.linkedin.com/in/joseapadilla\"><em class=\"icon-linkedin-2\"></em></a></li><li><a href=\"https://github.com/jonahoffline\"><em class=\"icon-github\"></em></a></li><li><a href=\"http://www.flickr.com/people/99104748@N07/\"><em class=\"icon-flickr\"></em></a></li><li><a href=\"http://dribbble.com/toxinide\"><em class=\"icon-dribbble-1\"></em></a></li><li><a href=\"http://www.pixelhipsters.com\"><em class=\"icon-globe-2\"></em></a></li></ul>")
      end
    end
  end

end
