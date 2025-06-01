/* eslint-disable no-undef */
import React from "react";
import "../../App.css";
import logo from "../../assets/logo.png";
import comlink from "../../assets/logo-comlink.png";
import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../firebase";
import { useNavigate } from "react-router-dom";

//Authentication Function

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      await signInWithEmailAndPassword(auth, email, password);
      navigate("/user-dashboard");
      // Redirect or show logged-in view
    } catch (err) {
      setError(err.message);
    }
  };

  const AdminLogin = () => {
    return (
      <>
        <section className="flex items-center justify-center h-screen gap-8">
          <div className="w-1/2 h-[95%] flex flex-col items-center justify-center bg-blue-400 rounded-xl shadow-lg p-4 m-5">
            <img src={logo} alt="logo" />
            <img src={comlink} alt="comlink" className="w-1/2" />
          </div>

          <div className="w-1/2 flex flex-col ">
            <h1 className="text-4xl font-extrabold mb-4">Sign In</h1>
            <form
              action="/admin/login"
              method="POST"
              className="space-y-4"
              onSubmit={handleLogin}
            >
              <div className="flex flex-col">
                {/* <label className="font-bold mb-1" htmlFor="username">
                Username:
              </label> */}
                <input
                  type="text"
                  id="username"
                  name="username"
                  required
                  className="border-2 border-blue-400 rounded-lg px-2 py-4 w-1/2 shadow-lg"
                  placeholder="Enter your username"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
              </div>
              <div className="flex flex-col">
                {/* <label className="font-bold" htmlFor="password">
                Password:
              </label> */}
                <input
                  type="password"
                  id="password"
                  name="password"
                  required
                  className="border-2 border-blue-400 rounded-lg p-3 w-1/2 shadow-md hover:shadow-lg active:shadow-lg active:border-blue-600"
                  placeholder="Enter your password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>
              <button
                type="submit"
                className="bg-blue-600 text-white w-1/3 py-4 mt-3 shadow-lg hover:shadow-xl rounded-lg hover:cursor-pointer hover:bg-blue-700 transition duration-300 ease-in-out active:bg-blue-800"
              >
                Login
              </button>
              {error && <p style={{ color: "red" }}>{error}</p>}
            </form>
          </div>
        </section>
      </>
    );
  };
}
export default AdminLogin;
