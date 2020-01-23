import React,{createContext,useReducer} from 'react'

const initialState = 
{
    tierName: "Basic",
    price: "100",
    clicked:false,
    duration: "7 Days",
    cost: 0,
    userType: "Single",
    addUser: false,
    userCount:[""],
    isLoading:false,
    remainingSubscriptionTime:'10 Days',
    subscriptionLevel:'PRO',
    username:'',
    email:'',
    password:'',
    token:'',
    annual:false,
    monthly:false,
    weekly:true

    }
  

const store = createContext(initialState)
const {Provider} = store
      


const StateProvider = ({children}) =>{
    const [state,dispatch] = useReducer((state,action)=>{
        switch(action.type){
            case 'LOAD_FORM_INFO': return action.payload
            case 'IS_LOADING': return false
            case 'WEEKLY': return {
                weekly: true,
                monthly: false,
                annual: false
            }
            case 'MONTHLY': return {
                    weekly:false,
                    monthly: true,
                    annual: false
                }
            
            case 'ANNUAL': return{
                    weekly:false,
                    monthly:false,
                    annual:true
                }
            case 'UPDATE_TIER_SELECTION': return action.payload

            case 'ADD_USER': return true
            
            default: return state
        }
},initialState)
    const {Provider} = store
        return(
            <Provider value={{state,dispatch}}>
                {children}
            </Provider>
        )
}

export {StateProvider,store}