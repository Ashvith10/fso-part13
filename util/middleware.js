const errorHandler = (error, req, res, next) => {
  console.error(error);

  if (error.name === 'SequelizeValidationError') {
    res.status(400).json({ error });
  }

  next(error);
};

export { errorHandler };
