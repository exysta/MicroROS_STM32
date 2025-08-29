/*
 * ping_pong.c
 *
 *  Created on: Aug 23, 2025
 *      Author: exysta
 */
#include "ping_pong.h"
#include <std_msgs/msg/string.h>
#include <stdio.h>
#include <string.h>

// Publisher and Subscriber handles
static rcl_publisher_t ping_pub;
static rcl_subscription_t pong_sub;
static std_msgs__msg__String msg_out;
static std_msgs__msg__String msg_in;

// Callback for received "pong" messages
static void pong_callback(const void *msgin)
{
    const std_msgs__msg__String *msg = (const std_msgs__msg__String *)msgin;
    printf("[micro-ROS] Received: %s\n", msg->data.data);
}

// Initialize publisher and subscriber
void ping_pong_init(rcl_node_t *node, rclc_executor_t *executor)
{
    rcl_allocator_t allocator = rcl_get_default_allocator();
    rcl_ret_t rc;

    // Create "ping" publisher
    rc = rclc_publisher_init_default(
        &ping_pub,
        node,
        ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String),
        "ping"
    );
    if (rc != RCL_RET_OK) {
        printf("Failed to create publisher: %ld\n", rc);
    }

    // Create "pong" subscriber
    rc = rclc_subscription_init_default(
        &pong_sub,
        node,
        ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String),
        "pong"
    );
    if (rc != RCL_RET_OK) {
        printf("Failed to create subscriber: %ld\n", rc);
    }

    // Allocate outgoing message buffer
    msg_out.data.data = (char *)malloc(20);
    msg_out.data.size = 0;
    msg_out.data.capacity = 20;

    // Allocate incoming message buffer
    msg_in.data.data = (char *)malloc(50);
    msg_in.data.size = 0;
    msg_in.data.capacity = 50;

    // Add subscriber to executor with callback
    rclc_executor_add_subscription(executor, &pong_sub, &msg_in, &pong_callback, ON_NEW_DATA);
}

// Helper function to publish a "ping" message
void ping_pong_publish_ping(void)
{
    snprintf(msg_out.data.data, msg_out.data.capacity, "ping");
    msg_out.data.size = strlen(msg_out.data.data);

    rcl_ret_t rc = rcl_publish(&ping_pub, &msg_out, NULL);
    if (rc != RCL_RET_OK) {
        printf("Publish failed: %d\n", rc);
    }
}


