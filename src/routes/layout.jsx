
import Navbar from "../components/NavBar/NavBar";
import TopNav from "../components/TopNav/TopNav";
import './layout.css';

const Layout = (props) => {
  return (
    <div className='layout-container'>
      <Navbar/>
   <div className="main-container">
   <TopNav/>
   <main>{props.children}</main>
   </div>
   </div>
  )
};

export default Layout;