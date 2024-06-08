
// Home route 
const homeController = async(req, res) => {
    console.log("Home route hit..");

    return res.status(200).json({
        message: 'Server is running'
    })
}

exports.homeController = homeController; 