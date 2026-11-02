.class public Lcom/disneymobile/mocha/NSHTTPURLResponse;
.super Lcom/disneymobile/mocha/NSURLResponse;
.source "NSHTTPURLResponse.java"


# instance fields
.field private final statusCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 1
    .param p1, "encodingName"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "contentLength"    # J
    .param p5, "statusCode"    # I

    .prologue
    .line 8
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/disneymobile/mocha/NSURLResponse;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 9
    iput p5, p0, Lcom/disneymobile/mocha/NSHTTPURLResponse;->statusCode:I

    .line 10
    return-void
.end method


# virtual methods
.method public statusCode()I
    .locals 1

    .prologue
    .line 13
    iget v0, p0, Lcom/disneymobile/mocha/NSHTTPURLResponse;->statusCode:I

    return v0
.end method
