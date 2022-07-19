import { Card, CardContent, Typography } from "@mui/material";
import Bear1 from "../../assets/img/bear-1.jpg";
import Bear2 from "../../assets/img/bear-2.jpg";
import Bear3 from "../../assets/img/bear-3.jpg";
import "./ContributorCard.css";
import { Link } from "react-router-dom";

export default function ContributorCard(props) {
    return (
        <Link to={'/contributor/' + props.user} className="contributor-card">
        <Card>
            <CardContent className="contributor-card-content"> 
                <img src={Bear1} alt="" />
               <span>{props.name} | {props.role}</span>
               <p>{props.description}</p>
            </CardContent>
        </Card>
        </Link>
    )
}