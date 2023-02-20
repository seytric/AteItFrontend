const mongoose = require("mongoose")
const bcrypt = require("bcrypt")
const userSchema = mongoose.Schema({
    username: {
        type: String,
        required: true,
        trim: true,
        unique: false,
        index: {
            unique: true
        }
    },
    email: {
        type: String,
        required: true,
        unique: true,
        lowercase: true,
        trim: true
    },
    password: {
        type: String,
        required: true,
        unique: false,
    },
    messages: [mongoose.Schema.Types.Mixed],
}, {timestamps: true})

userSchema.pre('save', async function(next){
    try {
        if(!this.isModified('password')) {
            return next()
        }
        const hashedPass = await bcrypt.hash(this.password, 10);
        return (this.password = hashedPass);
    } catch (error) {
        return next(error)
    }
})

userSchema.pre('updateOne', async function (next) {
    try {
      if (this._update.password) {
        const hashedPass = await bcrypt.hash(this._update.password, 10);
        this._update.password = hashedPass
      }
      return next();
    } catch (error) {
      return next(error)
    }
  })

userSchema.methods.verifyPassword = async function (plain_password) {
    return bcrypt.compare(plain_password, this.password)
}

const User = mongoose.model('Users', userSchema)
module.exports = User;