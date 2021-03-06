defmodule FeedbackApp.AuthTest do
  use FeedbackApp.DataCase

  alias FeedbackApp.Auth

  describe "users" do
    alias FeedbackApp.Auth.User

    @valid_attrs %{
      bio: "some bio",
      email: "some email",
      name: "some name",
      password: "some password"
    }
    @update_attrs %{
      bio: "some updated bio",
      email: "some updated email",
      name: "some updated name",
      password: "some updated password"
    }
    @invalid_attrs %{bio: nil, email: nil, name: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()

      assert Auth.list_users() == [%User{user | password: nil}]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()

      assert Auth.get_user!(user.id) == %User{user | password: nil}
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.name == "some name"
      assert Bcrypt.verify_pass("some password", user.password_hash)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      assert {:ok, user} = Auth.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert Bcrypt.verify_pass("some updated password", user.password_hash)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()

      assert %User{user | password: nil} == Auth.get_user!(user.id)
      assert Bcrypt.verify_pass("some password", user.password_hash)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()

      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()

      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end
end
