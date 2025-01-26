
function HelloWord(props) {
  return (
    <React.Fragment>
      Greeting: {props.greeting}
    </React.Fragment>
  );
}

HelloWord.propTypes = {
  greeting: PropTypes.string
};


