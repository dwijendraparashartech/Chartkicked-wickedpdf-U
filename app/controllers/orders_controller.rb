class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  # def index
  #   @orders = Order.all
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #       render template: "orders/index.html.erb",
  #         pdf: "Orders: #{@orders.count}"
  #     end
  #   end
  # end

  def index
    @orders = Order.all
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "orders/index.html.erb",
    #      window_status: "FLAG_FOR_PDF"
    #   end
    # end


    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "orders/index.html.erb",
               layout: "pdf",
               window_status: "FLAG_FOR_PDF" # Wait until window.status is equal to this string before rendering page
      end
    end
  #   binary_pdf = Dhalang::PDF.get_from_url("https://www.google.com") 
  #   send_data(binary_pdf, filename: 'orders/index.html.erb.pdf', type: 'application/pdf') 
  end


# def example_controller_method
#   binary_pdf = Dhalang::PDF.get_from_url("https://www.google.com")  
#   send_data(binary_pdf, filename: 'pdfofgoogle.pdf', type: 'application/pdf')  
# end




















  # render pdf: "orders",
  # page_size: "A4",
  # template: "orders/order.pdf.erb",
  # javascript_delay: 10000
  # # disable_javascript :false 
          

  # GET /orders/1 or /orders/1.json
  def show
  end



  def completed_tasks
    render json: Task.group(:goal_id).group_by_day(:completed_at).count.chart_json
  end


  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:price, :status)
    end
end
