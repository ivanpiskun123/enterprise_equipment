import React, {useState} from 'react';

const Counter = (props) => {

  const [count , setCount] = useState(props.counter.value)

  function increment(){
      setCount(count + 1)
    props.changeValue(count+1, props.counter.id)
  }
  function decrement(){
      setCount(count - 1)
     props.changeValue(count+1, props.counter.id)
  }


  return (
    <div>
      <hr></hr>
      <h2>{props.counter.title}</h2>
      <h1>
        {count}
        <br></br>
          <button onClick={increment}>Inc</button>
          <button onClick={decrement}>Dec</button>
      </h1>
        <div>
          <button onClick={ () => {props.remove(props.counter)} } > Delete</button>
        </div>
      <hr></hr>
    </div>
  )
}

export default Counter
