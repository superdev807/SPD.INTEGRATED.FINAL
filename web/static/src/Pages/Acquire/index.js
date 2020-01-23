import React, { useRef,useEffect,useContext } from "react";
import JssProvider from "react-jss/lib/JssProvider";
import MaterialUIForm from "react-material-ui-form";
import Navbar from "../../Components/Navbar";
import Grid from "@material-ui/core/Grid";
import Icon from "@material-ui/core/Icon";
import { FormComponent, FormContainer } from "react-authorize-net";
import AddGroupMember from "../../Components/AddGroupMember";
import ReactAuthorizeForm from "../../Components/React-Authorize.js";
//Material UI Components
import { withStyles, Button, TextField } from "@material-ui/core";
import {store} from '../../Store/'
import {styles} from './styles'
import './style.css'


const RegistrationForm = props => {
    const GlobalState = useContext(store)
    const {state,dispatch} = GlobalState
    const {classes} = props
    const submit =()=>{}
    const firstName = useRef('')
    const lastName = useRef('')
    const customInputHandler = ()=>{
        const value = firstName.current.value
        console.log(value)
    }
    const addUser = () => {
      dispatch({type:'ADD_USER'})
    }
    
   
    return(
        <div>
           <Navbar
          name={state.duration + " " + "Subscription Basis"}
        />
        <br />

        <JssProvider>
          <MaterialUIForm
            className={classes.registrationForm}
            onSubmit={submit}
          >
            <fieldset>
              <legend className={classes.legend}>
                {state.tierName} Registration
              </legend>
              <div className={classes.description}>
                <h4>Subscription Details</h4>
                <h5>Tier: {state.tierName}</h5>
                <h5>Duration: {state.duration}</h5>
                <h5>User Type: {state.userType}</h5>
                <h5>Price: $ {state.price}</h5>
              </div>

              <Grid container>
                <Grid item={6}>
                  <Icon className={classes.icon}>account_circle</Icon>
                  <input placeholder="First Name" onChange={customInputHandler} ref={firstName} />
                  
                </Grid>
                <Grid item={6}>
                  <Icon className={classes.icon}>account_circle</Icon>
                  <input placeholder="Last Name" onChange={customInputHandler} ref={lastName} />
                  
                </Grid>
                <br />
                <br />
                <br />
                <Grid item={6}>
                  <Icon className={classes.icon}>mail</Icon>

                  <TextField
                    className={classes.inputs}
                    label="Email"
                    type="email"
                    name="email"
                    value=""
                    data-validators="isRequired,isEmail"
                    onChange={customInputHandler}
                  />
                </Grid>
                <br />
                <br />
                <br />
                <Grid item={6}>
                  <Icon className={classes.icon}>account_circle</Icon>
                  <TextField
                    className={classes.inputs}
                    label="User Name"
                    type="text"
                    name="userName"
                    value=""
                    data-validators="isRequired"
                    onChange={customInputHandler}
                  />
                </Grid>
                <br />
                <br />
                <br />

                <Grid item={6}>
                  <Icon className={classes.icon}>lock</Icon>
                  <TextField
                    className={classes.inputs}
                    label="Password"
                    type="password"
                    name="password"
                    value=""
                    data-validators={[
                      {
                        isLength: {
                          min: 6,
                          max: 16
                        }
                      },
                      "isAlias"
                    ]}
                    onChange={customInputHandler}
                  />
                </Grid>
                <Grid item={6}>
                  <Icon className={classes.icon}>lock</Icon>
                  <TextField
                    className={classes.inputs}
                    label="Confirm Password"
                    type="password"
                    name="passwordConfirm"
                    value=""
                    data-validators={[
                      {
                        isLength: {
                          min: 6,
                          max: 16
                        }
                      },
                      "isAlias"
                    ]}
                    onChange={customInputHandler}
                  />
                </Grid>
                <Grid item={6}>
          <TextField
            className={classes.inputs}
            label="Company Name"
            type="text"
            name="companyName1"
            value={state.companyName1}
            data-validators="isRequired"
           
          /> 
        </Grid>
        <Grid item={6}>
          <TextField
            className={classes.inputs}
            label="Job Title"
            type="text"
            name="jobTitle"
            value={state.jobTitle}
            data-validators="isRequired"
            
          />
        </Grid>
        <Grid item={6}>
          <TextField
            className={classes.inputs}
            label="Years Of Industry Experience"
            type="text"
            name="yoie"
            value={state.yoie}
            data-validators="isRequired"
            
          />
        </Grid>
    
              </Grid>
            
              <br />
              <br />
              {state.userType === "MULTI (6 MAX)"? (
                <Button color="inherit" variant="outlined" size="large" onClick={addUser} className={state.clicked?classes.removeBtn:classes.addUserBtn}>
                  <Icon className={classes.addIcon}>group_add</Icon>
                  Add Users
                </Button>
              
              ) : 
                null
              }
              { state.addUser ? (
                  <div>
                  
                    {state.userCount.map(user=>user)}
                   
                    <Button color="inherit" variant="outlined" size="large" onClick={addUser} className={classes.addUserBtn}>
                  <Icon className={classes.addIcon}>group_add</Icon>
                  Add Users
                </Button>
                
                </div>
                
              ) : (
              false
              
              )}}
               <hr className={classes.hr}/>
              <h3 className={classes.center}>Billing information</h3>

                 <TextField
                    className={classes.inputs}
                    label="Name"
                    type="text"
                    name="Name"
                    value=""
                    data-validators="isRequired"
                    onChange={customInputHandler}
                  />

              <TextField
                    className={classes.inputs}
                    label="Street"
                    type="text"
                    name="Street"
                    value=""
                    data-validators="isRequired"
                    onChange={customInputHandler}
                  />
              <TextField
                    className={classes.inputs}
                    label="City"
                    type="text"
                    name="City"
                    value=""
                    data-validators="isRequired"
                    onChange={customInputHandler}
                  />
              <TextField
                    className={classes.inputs}
                    label="state"
                    type="text"
                    name="state"
                    value=""
                    data-validators="isRequired"
                    onChange={customInputHandler}
                  />
              <TextField
                    className={classes.inputs}
                    label="Zip"
                    type="text"
                    name="Zip"
                    value=""
                    data-validators="isRequired"
                    onChange={customInputHandler}
                  />

              <br />
              <br />
              <FormContainer
                environment="sandbox"
               
                amount={state.price}
                component={FormComponent}
              />

              <Button
                className={classes.submitBtn}
                variant="outlined"
                type="submit"
              >
                <Icon>send</Icon>
                  Submit
              </Button>
            </fieldset>
          </MaterialUIForm>
        </JssProvider>
      </div>
    )
 
}

export default withStyles(styles)(RegistrationForm);
