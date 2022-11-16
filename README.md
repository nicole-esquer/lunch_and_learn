# Lunch and Learn 

<b>Lunch and Learn</b> is an app that allow users to search for recipes by country, favorite recipes, and the ability to learn more about a particular country.

<h2> Table of Contents</h2>
<details open="open">
<summary>Table of Contents</summary>
  <ol>
    <li><a href="#technical-requirements"> Technical Requirements</a></li>
    <li><a href="#gems-and-tools"> Gems and Tools</a></li>
    <li><a href="#installation"> Installation</a></li>
    <li><a href="#schema"> Schema</a></li>
    <li><a href="#endpoints"> Server API Endpoint</a></li>
  </ol>
</details>

<h2 id="technical-requirements">Technical Requirements</h2>
<ul>
<li>Ruby 2.7.4</li>
<li>Rails 5.2.8</li>
</ul>

<h2 id="gems-and-tools">Gems and Tools</h2>
<ul>
  <li><a href="https://github.com/thoughtbot/factory_bot_rails">Factory Bot</a></li>
  <li><a href="https://github.com/faker-ruby/faker">Faker</a></li>
  <li><a href="https://github.com/lostisland/faraday">Faraday</a></li>
  <li><a href="https://github.com/laserlemon/figaro">Figaro</a></li>
  <li><a href="https://github.com/jsonapi-serializer/jsonapi-serializer#installation">JsonApi Serializer</a></li>
  <li><a href="https://www.postman.com/">Postman</a></li>
  <li><a href="https://github.com/pry/pry">Pry</a></li>
  <li><a href="https://github.com/simplecov-ruby/simplecov">SimpleCov</a></li>
  <li><a href="https://relishapp.com/vcr/vcr/docs">VCR</a></li>
  <li><a href="https://github.com/bblimke/webmock">Webmock</a></li>
  <li><a href="https://github.com/rspec/rspec-rails">RSpec</a></li>
</ul>

<h2 id="installation"> Installation </h2>

To get started, clone the repo in your terminal by entering the following:
<ul>
  <li>git clone git@github.com:nicole-esquer/lunch_and_learn.git</li>
</ul>  
   
Once cloned, run the following commands:
<ul>
  <li>bundle install</li>
  <li>rails db:create</li>
  <li>rails db:migrate</li>
  <li>Run the Figaro command: <em>bundle exec figaro install</em></li><br>

Sign up for the following API keys and update the `application.yml` file with `ENV` variables to store the API keys: <br>
  <li>Sign up for the YouTube API key <a href="https://developers.google.com/youtube/v3/getting-started">here</a>. Enter it to the file like so: <em>youtube_api_key: '< your api key >'</em>.</li><br>
  <li>Sign up for the Unsplash Image API key <a href="https://unsplash.com/developers">here</a>. Enter it to the file like so: <em>unsplash_access_key: '< your api key >'</em> and <em>edamam_api_key: '< your api key >'</em>.</li><br>
  <li>Sign up for the Edamam Recipe API key <a href="https://developer.edamam.com/edamam-recipe-api">here</a>. Enter it to the file like so: <em>edamam_application_id: '< your api key >'</em> and <em>edamam_application_id: '< your api key >'</em>.</li><br>
</ul>  

<h2 id="schema"> Schema</h2>

<img width="487" alt="Screenshot 2022-11-16 at 4 27 21 AM" src="https://user-images.githubusercontent.com/98506079/202168683-79b82c51-9113-4046-8372-e26ab8af20ee.png">

<h2 id="endpoints"> Endpoints</h2>

<h4>Get Recipes For A Particular Country</h4>
<pre>
<code>
GET /api/v1/recipes?country=thailand
    {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
    ]
}
</code>
</pre>

<h4>Get Learning Resources for a Particular Country</h4>
<pre>
<code>
GET /api/v1/learning_resources?country=laos

    {
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                }
              ]
        }
    }
}
</code>
</pre>

<h4>User Registration</h4>
<pre>
<code>
POST /api/v1/users

    {
      "data": {
        "type": "user",
        "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
</code>
</pre>

<h4>Add Favorites</h4>
<pre>
<code>
POST /api/v1/favorites

    {
    "success": "Favorite added successfully"
    }

</code>
</pre>

<h4>Get a User’s Favorites</h4>
<pre>
<code>
GET /api/v1/favorites

  {
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Recipe: Egyptian Tomato Soup",
                "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                "country": "egypt",
                "created_at": "2022-11-02T02:17:54.111Z"
            }
        }
</code>
</pre>
