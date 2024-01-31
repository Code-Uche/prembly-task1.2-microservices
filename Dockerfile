# Stage 1: Build the application
FROM node:14 AS build
WORKDIR /app
COPY package.json .
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Create a smaller image
FROM node:14-alpine
WORKDIR /app
COPY --from=build /app/dist /app
CMD ["npm", "start"]

