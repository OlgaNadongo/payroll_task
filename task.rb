class Payroll
    attr_accessor :basic_salary, :benefits
    def initialize(attributes)
        attributes.each do |key, value|
            self.send("#{key}=",value)
        end
    end

    def payee
        #payee=basic_sal+benefits
        basic_salary+benefits
    end

    def nhifdeductions
        case self.payee
        when(0...6000)
            150
        when(6000...8000)
            300
        when(8000...12000)
            400
        when(12000...15000)
            500
        when(15000...20000)
            600
        when(20000...25000)
            750
        when(25000...70000)
            850
        else
            0
        end
    end
    
    def nssfdeductions
        self.payee*12/100
    end

    def gross_salary
        self.payee
    end

    def net_salary
        self.payee-self.nhifdeductions-self.nssfdeductions
    end

end

employee=Payroll.new({basic_salary:40000,benefits:5000})

puts employee.payee
puts employee.nhifdeductions
puts employee.nssfdeductions
puts employee.gross_salary
puts employee.net_salary