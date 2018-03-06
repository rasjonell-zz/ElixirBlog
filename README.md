# Phoenix Blog

[LIVE DEMO](https://rasjonell.herokuapp.com/)

## To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Admin User

To create an admin user run ```iex -S mix``` then:

```elixir
iex> alias Blog.{Repo, User}
[Blog.Repo, Blog.User]
iex> changeset = User.registration_changeset(%User{}, %{
...>   username: "admin_user", name: "Your Name", password: "some_uncrackable_password"
...> })
 #Ecto.Changeset<
 	action: nil,
 	changes: %{
   	name: "Admin",
   	password: "admin123",
   	password_hash: "$argon2i$v=19$m=65536,t=6,p=1$vjdJod9fn+NUjYQHLPwnXQ$Ccobt7d9BoBCmahsADJbfvJMhX0mkgzxPedxvIJTSlM",
   	username: "admin"
 	},
 	errors: [],
 	data: #Blog.User<>,
 	valid?: true
 >
iex> Repo.insert(changeset)
{:ok,
 %Blog.User{
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
   id: 1,
   inserted_at: ~N[2018-03-05 16:16:23.930298],
   name: "Admin",
   password: "admin123",
   password_hash: "$argon2i$v=19$m=65536,t=6,p=1$vjdJod9fn+NUjYQHLPwnXQ$Ccobt7d9BoBCmahsADJbfvJMhX0mkgzxPedxvIJTSlM",
   updated_at: ~N[2018-03-05 16:16:23.933509],
   username: "admin"
}} 
```

## Login To Admin Dashboard

To get all the possible routes run: ```mix phoenix.routes```

The login page is available at: ```/sessions/new/```



## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
