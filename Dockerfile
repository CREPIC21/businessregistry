FROM node:19-alpine
ARG MONGO_URI_ARG=test
ARG NODE_ENV_ARG=test
ARG PORT_ARG=5000
ARG GEOCODER_PROVIDER_ARG=test
ARG GEOCODER_API_KEY_ARG=test
ARG FILE_UPLOAD_PATH_ARG=test
ARG MAX_FILE_UPLOAD_ARG=test
ARG JWT_SECRET_ARG=test
ARG JWT_EXPIRE_ARG=test
ARG JWT_COOKIE_EXPIRE_ARG=test
ARG SMTP_HOST_ARG=test
ARG SMTP_PORT_ARG=test
ARG SMTP_EMAIL_ARG=test
ARG SMTP_PASSWORD_ARG=test
ARG FROM_EMAIL_ARG=test
ARG FROM_NAME_ARG=test
ARG PAY_PAL_CLIENT_ID_ARG=test
ARG PAY_PAL_CLIENT_SECRET_ARG=test
ARG SHEETY_API_POST_ARG=test
WORKDIR /app
ENV MONGO_URI=$MONGO_URI_ARG
ENV NODE_ENV=$NODE_ENV_ARG
ENV PORT=$PORT_ARG
ENV GEOCODER_PROVIDER=$GEOCODER_PROVIDER_ARG
ENV GEOCODER_API_KEY=$GEOCODER_API_KEY_ARG
ENV FILE_UPLOAD_PATH=$FILE_UPLOAD_PATH_ARG
ENV MAX_FILE_UPLOAD=$MAX_FILE_UPLOAD_ARG
ENV JWT_SECRET=$JWT_SECRET_ARG
ENV JWT_EXPIRE=$JWT_EXPIRE_ARG
ENV JWT_COOKIE_EXPIRE=$JWT_COOKIE_EXPIRE_ARG
ENV SMTP_HOST=$SMTP_HOST_ARG
ENV SMTP_PORT=$SMTP_PORT_ARG
ENV SMTP_EMAIL=$SMTP_EMAIL_ARG
ENV SMTP_PASSWORD=$SMTP_PASSWORD_ARG
ENV FROM_EMAIL=$FROM_EMAIL_ARG
ENV FROM_NAME=$FROM_NAME_ARG
ENV PAY_PAL_CLIENT_ID=$PAY_PAL_CLIENT_ID_ARG
ENV PAY_PAL_CLIENT_SECRET=$PAY_PAL_CLIENT_SECRET_ARG
ENV SHEETY_API_POST=$SHEETY_API_POST_ARG
COPY . /app
RUN npm install
EXPOSE 5000
CMD npm run dev

# build an image
# - docker build -t crepic21/hello-world-bsnodejs:0.0.1.RELEASE .
# - docker build -t crepic21/hello-world-bsnodejs:0.0.2.RELEASE .

# run the container from the image
# - docker run -i -t -d -p 5000:5000 crepic21/hello-world-bsnodejs:0.0.1.RELEASE
# - docker run -i -t -d -p 5001:5000 crepic21/hello-world-bsnodejs:0.0.2.RELEASE

# check history 
# - docker history <image_id>

# check logs 
# - docker logs -f <container_id>

# push to dockerhub
# - login in terminal first "docker login"
# - docker push crepic21/hello-world-bsnodejs:0.0.1.RELEASE
# - docker push crepic21/hello-world-bsnodejs:0.0.2.RELEASE