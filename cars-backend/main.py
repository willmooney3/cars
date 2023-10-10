from fastapi import FastAPI
import smartcar


app = FastAPI()
client = smartcar.AuthClient()


@app.get("/exchange")
def get_access_code(code: str):
    """Allows the user to convert a client-side access code into an access
    token.

    Args:
        code (str): The access code to exchange

    Return:
        dict containing a str accessToken
    """
    access_object = client.exchange_code(code)
    return {"accessToken": access_object.access_token}


@app.get("/vehicles")
def get_user_vehicles(access_token: str):
    """Get a list of vehicles for the user.

    Args:
        access_token (str): The user's access token

    Return:
        dict containing a list of vehicles
    """
    vehicles = []
    vehicle_ids = smartcar.get_vehicles(access_token)
    for vehicle_id in vehicle_ids.vehicles:
        vehicle = smartcar.Vehicle(vehicle_id, access_token)
        attrs = vehicle.attributes()
        vehicles.append({
            "id": vehicle_id,
            "make": attrs.make,
            "model": attrs.model,
            "year": str(attrs.year),
        })
    return {"vehicles": vehicles}


@app.get("/vehicles/{vehicle_id}")
def get_user_vehicle(vehicle_id: str, access_token: str):
    """Get relevant details on a specific vehicle for the user.

    Args:
        vehicle_id (str): The ID of the vehicle to get details for
        access_token (str): The user's access token

    Return:
        dict containing the vehicle details
    """
    vehicle_details = smartcar.Vehicle(
        vehicle_id,
        access_token,
        {"unit_system": "imperial"}
    )
    attrs = vehicle_details.attributes()
    location = vehicle_details.location()
    vehicle = {
        "id": vehicle_id,
        "make": attrs.make,
        "model": attrs.model,
        "year": str(attrs.year),
        "odometer": str(vehicle_details.odometer().distance),
        "latitude": location.latitude,
        "longitude": location.longitude,
    }
    return {"vehicle": vehicle}
