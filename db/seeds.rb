User.destroy_all

users = User.create([
  {
    name: "Charles Munat",
    email: "charles@munat.com",
    password: "!Q2w#E4r",
    password_confirmation: "!Q2w#E4r"
  },
  {
    name: "Scott Searer",
    email: "luziyu8@gmail.com",
    password: "!QAZxsw2#EDCvfr4",
    password_confirmation: "!QAZxsw2#EDCvfr4"
  }
])