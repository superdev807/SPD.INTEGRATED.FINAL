import React, { Component,useContext } from "react";
import PropTypes from "prop-types";
import { withStyles } from "@material-ui/core/styles";
import Grid from "@material-ui/core/Grid";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
import tierDatas from "./TierDatas";
import { Link } from "react-router-dom";
import {store} from '../../Store/'
import {styles} from './styles'

const PricingCards = props =>{
      const GlobalContext = useContext(store)
      const {state,dispatch} = GlobalContext
      const {classes} = props
      const showTier = (e =>{
        switch (e.target.textContent) {
            case "Weekly": dispatch({type:'WEEKLY'})
              break;
            case "Monthly": dispatch({type:'MONTHLY'})
              break;

            case "Annually": dispatch({type:'ANNUAL'})
          }

      })
      return(
        <div className={classes.container}>
        <h2 className={classes.header}>Pricing</h2>
        <Grid container>
          <Grid item xs={5} />
          <p className={classes.center}> Select your pricing tier</p>
          <Grid item xs={12} />
          <Grid item xs={4} />
          <Button
            className={classes.Button}
            size="large"
            color="inherit"
            variant="outlined"
            fullwidth
            type="Weekly"
            onClick={e => {
              showTier(e);
            }}
          >
            Weekly
          </Button>
          <Button
            className={classes.Button}
            size="large"
            color="inherit"
            variant="outlined"
            fullwidth
            type="Monthly"
            onClick={e => {
              showTier(e);
            }}
          >
            Monthly
          </Button>
          <Button
            className={classes.Button}
            size="large"
            color="inherit"
            variant="outlined"
            fullwidth
            onClick={e => {
              showTier(e);
            }}
          >
           Annually
          </Button>
        </Grid>

        <Grid container spacing={12}>
          {state.weekly ?
           tierDatas[0].map((card, i) => {
                return (
                  <Grid className={classes.Rectangle} item xs={3}>
                    <Card className={classes.card}>
                      <CardActionArea>
                        <CardContent>
                          <Typography
                            className={classes.free}
                            gutterBottom
                            variant="h5"
                            component="h2"
                          >
                            {card.title}
                          </Typography>

                          <Typography component="p">
                            {" "}
                            <h3>${card.price}</h3>
                            <small className={classes.Free}>
                              Try for 7 days
                            </small>
                          </Typography>
                          <br />
                          <Typography className={classes.Free} component="p">
                            {card.description}
                          </Typography>
                        </CardContent>
                      </CardActionArea>
                      <CardActions>
                        <Grid item xs={1} />
                        <Button
                          className={classes.Free}
                          color="inherit"
                          variant="outlined"
                          fullwidth
                        >
                          <Link
                            className={classes.links}

                            to={{
                              pathname: "/acquire",
                              state: {
                                tierName: card.title,
                                cost: card.price,
                                duration: card.duration,
                                userType:
                                  card.type === "Multi" ? "Multi" : "Single"
                              }
                            }}
                          >
                            Sign up for {card.title}
                          </Link>
                        </Button>
                      </CardActions>
                    </Card>
                  </Grid>
                );
              })
            : state.monthly
            ? tierDatas[1].map((card, i) => {
                return (
                  <Grid className={classes.Rectangle} item xs={3}>
                    <Card className={classes.card}>
                      <CardActionArea>
                        <CardContent>
                          <Typography
                            className={classes.free}
                            gutterBottom
                            variant="h5"
                            component="h2"
                          >
                            {card.title}
                          </Typography>

                          <Typography component="p">
                            {" "}
                            <h3>${card.price}</h3>
                            <small className={classes.Free}>
                              {card.duration}
                            </small>
                          </Typography>
                          <br />
                          <Typography className={classes.Free} component="p">
                            {card.description}
                          </Typography>
                        </CardContent>
                      </CardActionArea>
                      <CardActions>
                        <Grid item xs={1} />
                        <Button
                          className={classes.Free}
                          color="inherit"
                          variant="outlined"
                          fullwidth
                        >
                          <Link
                            className={classes.links}
                            to={{
                              pathname: "/acquire",
                              state: {
                                tierName: card.title,
                                cost: card.price,
                                duration: card.duration,
                                userType:
                                  card.type === "Multi" ? "Multi" : "Single"
                              }
                            }}
                          >
                            Sign up for {card.title}
                          </Link>
                        </Button>
                      </CardActions>
                    </Card>
                  </Grid>
                );
              })
            : state.annual
            ? tierDatas[2].map((card, i) => {
                return (

                  <Grid className={classes.Rectangle} item xs={3}>
                    <Card className={classes.card}>
                      <CardActionArea>
                        <CardContent>
                          <Typography
                            className={classes.free}
                            gutterBottom
                            variant="h5"
                            component="h2"
                          >
                            {card.title}
                          </Typography>

                          <Typography component="p">
                            {" "}
                            <h3>${card.price}</h3>
                            <small className={classes.Free}>
                              {card.duration}
                            </small>
                          </Typography>
                          <br />
                          <Typography className={classes.Free} component="p">
                            {card.description}
                          </Typography>
                        </CardContent>
                      </CardActionArea>
                      <CardActions>
                        <Grid item xs={1} />
                        <Button
                          className={classes.Free}
                          color="inherit"
                          variant="outlined"
                          fullwidth
                        >
                          <Link
                            onClick={dispatch({type:'UPDATE_USER_TIER',payload:{
                                tierName:card.title,
                                cost:card.price,
                                duration:card.duration,
                                userType:
                                card.type === 'Multi' ? 'Multi': 'Single'
                            
                            
                            }})}
                            className={classes.links}
                            to={{
                              pathname: "/acquire",
                              state: {
                                tierName: card.title,
                                cost: card.price,
                                duration: card.duration,
                                userType:
                                  card.type === "Multi" ? "Multi" : "Single"
                              }
                            }}
                          >
                            Sign up for {card.title}
                          </Link>
                        </Button>
                      </CardActions>
                    </Card>
                  </Grid>
                )
              })
            : false}
        </Grid>
      </div>

      )
    }
        
      
    
    


PricingCards.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(PricingCards);
