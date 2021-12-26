# PATH Challenge

Used API : https://developer.marvel.com

# Screens
![Alt text](https://user-images.githubusercontent.com/46631211/147421482-e5d8ff60-2572-4e74-b47f-4c540409d4b7.png "Home")
![Alt text](https://user-images.githubusercontent.com/46631211/147421484-ac20d234-6c07-40c5-8366-fbb73ff079f9.png "Detail")
![Alt text](https://user-images.githubusercontent.com/46631211/147421485-4084075e-1712-4d93-ab5c-dc84085795c4.png "Comics")



## File Structure

- Core : Abstract of services and transferable content to other projects
- Data : Retrofit services
- Presentation :  Blocs, Bloc repositories and views
- Products : Project specific services, models and more
- Test : Unit test of network manager and home repository.

## Used API Points

- GET /v1/public/characters
- GET /v1/public/characters/{characterId}/comics

## Used Packages
#### Network
 - dio 
 - retrofit
 - json_serializable / json_annotation
#### State Management
 - flutter_bloc
 - equatable (for state attributes)

#### More
 - infinite_scroll_pagination
 - shimmer

Contact Me: 
- E-Mail se.hasanciftci@gmail.com
- Linked-in https://www.linkedin.com/in/hasan-çiftçi-6bbb79103/
