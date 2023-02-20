const router = require('express').Router();
const userController = require('../controllers/userController');
const {isAuthenticated, signup} = require('../middlewares');
const multer = require('multer')
const upload = multer({dest: 'uploads/'})

router.post('/signup',  upload.single('image'), signup, userController.signup);
router.post('/login', userController.login);
router.get('/dash', isAuthenticated, userController.findById);
module.exports = router;